import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fcm_api/models/serializers.dart';

import 'android_config.dart';
import 'notification.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  /// The identifier of the message sent, in the format of projects/*/messages/{message_id}.
  @nullable
  String get name;


  /// Registration token to send a message to.
  String get token;

  /// Android specific options for messages sent through FCM connection server.
  @nullable
  AndroidConfig get android;

  /// Arbitrary key/value payload.
  /// The key should not be a reserved word
  /// ("from", "message_type", or any word starting with "google" or "gcm").
  @nullable
  BuiltMap<String, String> get data;

  @nullable
  Notification get notification;

  Message._();

  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Message.serializer, this);
  }

  static Message fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Message.serializer, json);
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}
