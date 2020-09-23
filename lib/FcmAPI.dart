import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:googleapis/fcm/v1.dart' as fmc;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';

import 'models/message.dart';
import 'models/notification.dart';

Logger _logger = Logger('FcmAPI');

class FcmAPI {
  auth.AutoRefreshingAuthClient client;
  fmc.FcmApi _fcmApi;
  String _projectId;

  /// initializeApp connect to firebase servers
  /// The OAuth2 token ell automatically refresh
  /// [secret] can be found in your firebase project > options
  ///   > Service Account > Generate new private key
  Future<void> initializeApp({@required Map<String, dynamic> secret}) async {
    _logger.fine('Executing initializeApp');

    // Get the project id
    assert(secret.containsKey('project_id'));
    _projectId = secret['project_id'];

    // Get the credentials
    final accountCredentials = new auth.ServiceAccountCredentials.fromJson(secret);

    // Set the scope to access fmc services
    var scopes = [fmc.FcmApi.CloudPlatformScope];

    // Connect
    this.client = await auth.clientViaServiceAccount(accountCredentials, scopes);

    // Create a FmcApi instance to send the messages
    _fcmApi = fmc.FcmApi(client);
  }

  /// Send a message to specified registration token
  void send(Message message) {
    _logger.fine('Executing send');

    if (_fcmApi == null) throw NotInitializedError();

    // Embed the message in a SendMessageRequest
    fmc.SendMessageRequest request = fmc.SendMessageRequest.fromJson({
      'message': message.toJson(),
    });

    // Send the notification
    _fcmApi.projects.messages.send(request, 'projects/$_projectId');
  }

  /// Send the messages batch requests
  /// The batch size in 500 maximum so this function
  /// automatically splits the messages in the minimum number
  /// of batches needed.
  Future<void> sendAll(List<Message> messages) async {
    _logger.fine('Executing sendAll');
    if (_fcmApi == null) throw NotInitializedError();

    final List<Future> requests = [];
    for (int index = 0; index <= messages.length ~/ 500; index++)
      requests.add(
          _sendBatch(messages.sublist(index * 500, min((index + 1) * 500, messages.length))));

    Future.wait(requests);
  }

  /// Sends a batch request the fcm api
  /// Do not use this function directly, use sendAll which arrange the request
  /// in multiple batches if needed.
  Future<void> _sendBatch(List<Message> messages) async {
    _logger.fine('Executing sendBatch');
    assert(messages.length <= 500);

    var response = await http.post(
      'https://fcm.googleapis.com/batch',
      headers: {
        'Authorization': 'Bearer ${client.credentials.accessToken.data}',
        'Content-Type': 'multipart/mixed; boundary=subrequest_boundary',
      },
      body: [
            for (Message message in messages)
              "--subrequest_boundary\n"
                      "Authorization: Bearer ${client.credentials.accessToken.data}\n"
                      "Content-Transfer-Encoding: binary\n"
                      "Content-Type: application/http\n"
                      "\n"
                      "POST /v1/projects/$_projectId/messages:send\n"
                      "Content-Type: application/json\n"
                      "accept: application/json\n"
                      "\n" +
                  "${jsonEncode({"message": message.toJson()})}\n"
          ].join('\n') +
          "\n--subrequest_boundary--",
    );

    // print(response.body);

    // TODO: Detect errors inside the batch
    if (response.statusCode != 200) throw SendError(error: response.body);
  }

  void close() {
    client.close();
  }
}

abstract class FcmAPIError implements Exception {}

class NotInitializedError extends FcmAPIError {
  @override
  String toString() =>
      '${this.runtimeType}: FcmAPI is not initialized or initialization failed. Please call initializeApp.';
}

class SendError extends FcmAPIError {
  final String error;

  SendError({@required this.error});

  @override
  String toString() =>
      '${this.runtimeType}: one or multiple messages could not be sent.\n$error';
}

main() async {
  // Grab the secret file
  Map<String, dynamic> secret = jsonDecode(
      File('/home/lulupointu/Downloads/tinter-2c20c-firebase-adminsdk-miqgz-8935722edb.json')
          .readAsStringSync());

  FcmAPI fcmAPI = FcmAPI();
  await fcmAPI.initializeApp(secret: secret);

  // Create some test messages
  Message message1 = Message(
    (b) => b
      ..token =
          'dOM29qBIRse08oVCnF1G9s:APA91bGmopOKRKonCS0kOwW4bXajjO0H--SOVzXfCXf_fE7rujDkeoeT58n3oybdoOPk7_2ndS0KnaDByOXAwDuRe5sUmaRgKAM4HrJJ3sNPsY_rJoKUyrVu4vt3lUpRea6rkSnSAhpK'
      ..data =
          BuiltMap<String, String>.from({'some data key 1': 'some data value 1'}).toBuilder(),
  );
  Message message2 = Message(
    (b) => b
      ..token =
          'dOM29qBIRse08oVCnF1G9s:APA91bGmopOKRKonCS0kOwW4bXajjO0H--SOVzXfCXf_fE7rujDkeoeT58n3oybdoOPk7_2ndS0KnaDByOXAwDuRe5sUmaRgKAM4HrJJ3sNPsY_rJoKUyrVu4vt3lUpRea6rkSnSAhpK'
      ..data =
          BuiltMap<String, String>.from({'some data key 2': 'some data value 2'}).toBuilder(),
  );
  Message message3 = Message(
    (b) => b
      ..token =
          'dOM29qBIRse08oVCnF1G9s:APA91bGmopOKRKonCS0kOwW4bXajjO0H--SOVzXfCXf_fE7rujDkeoeT58n3oybdoOPk7_2ndS0KnaDByOXAwDuRe5sUmaRgKAM4HrJJ3sNPsY_rJoKUyrVu4vt3lUpRea6rkSnSAhpK'
      ..data =
          BuiltMap<String, String>.from({'some data key 3': 'some data value 3'}).toBuilder(),
  );

  // await fcmAPI.send(message1);
  //
  // await fcmAPI.sendAll([message2, message3]);

  List<String> tokens = [
    'eQAvEHkzQAOB1OFqUuubk_:APA91bGCWX4MQRo4_BmodZHimClmNWlftO2YYMCwjrJxqw8Ih3L5HPInEfWEVo5NoVa3UEUxFvxWUFbJ101yThP6kOX4BUe1jB4UFjVw_wJ9kBWa8fMfpKkBSGVvPVwHJdnmvlrrJegx',
    'c-Wjh0UpRUWhbw9dTLWadk:APA91bHHQt6xAZlCxshjvvkyOQ1M6vOtcnJv2HJDhoN3aAWKJKB4gqUgjTcv_CbNnlZUxv-n0ghvJSiAiiyjrfvUOLwHo_yHQ-daES-akPpPJxXV3Lbd2tW2YYma6PtZqlvI80NAOaZ0',
    'dOM29qBIRse08oVCnF1G9s:APA91bGmopOKRKonCS0kOwW4bXajjO0H--SOVzXfCXf_fE7rujDkeoeT58n3oybdoOPk7_2ndS0KnaDByOXAwDuRe5sUmaRgKAM4HrJJ3sNPsY_rJoKUyrVu4vt3lUpRea6rkSnSAhpK',
  ];
  // Send the notifications
  await fcmAPI.sendAll(tokens
      .map((String token) => Message(
            (b) => b
              ..token = token
              ..data = BuiltMap<String, String>.from({
                'title': 'relationStatusScolaireUpdate',
                'relationStatus': jsonEncode({
                  'statusScolaire': 'askedBinome',
                  'login': 'vannier',
                  'otherLogin': 'delsol_l'
                }),
                'binomeName': 'Emilien',
                'binomeSurname': 'Vannier',
              }).toBuilder(),
          ))
      .toList());

  fcmAPI.close();
}
