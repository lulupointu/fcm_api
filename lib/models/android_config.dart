import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'android_fcm_options.dart';
import 'serializers.dart';

part 'android_config.g.dart';

abstract class AndroidConfig implements Built<AndroidConfig, AndroidConfigBuilder> {
  /// An identifier of a group of messages that can be collapsed, so that only
  /// the last message gets sent when delivery can be resumed. A maximum of 4
  /// different collapse keys is allowed at any given time.
  @nullable
  String get collapseKey;


  /// If set to true, messages will be allowed to be delivered to the app while
  /// the device is in direct boot mode. See [Support Direct Boot
  /// mode](https://developer.android.com/training/articles/direct-boot).
  @nullable
  bool get directBootOk;

  /// Options for features provided by the FCM SDK for Android.
  @nullable
  AndroidFcmOptions get fcmOptions;


  /// Message priority. Can take "normal" and "high" values.
  /// For more information, see [Setting the priority of a
  /// message](https://goo.gl/GjONJv).
  /// Possible string values are:
  /// - "NORMAL" : Default priority for data messages. Normal priority messages
  /// won't open
  /// network connections on a sleeping device, and their delivery may be
  /// delayed to conserve the battery. For less time-sensitive messages, such
  /// as notifications of new email or other data to sync, choose normal
  /// delivery priority.
  /// - "HIGH" : Default priority for notification messages. FCM attempts to
  /// deliver high
  /// priority messages immediately, allowing the FCM service to wake a
  /// sleeping device when possible and open a network connection to your app
  /// server. Apps with instant messaging, chat, or voice call alerts, for
  /// example, generally need to open a network connection and make sure FCM
  /// delivers the message to the device without delay. Set high priority if
  /// the message is time-critical and requires the user's immediate
  /// interaction, but beware that setting your messages to high priority
  /// contributes more to battery drain compared with normal priority messages.
  @nullable
  String get priority;

  /// Package name of the application where the registration token must match in
  /// order to receive the message.
  @nullable
  String get restrictedPackageName;

  /// How long (in seconds) the message should be kept in FCM storage if the
  /// device is offline. The maximum time to live supported is 4 weeks, and the
  /// default value is 4 weeks if not set. Set it to 0 if want to send the
  /// message immediately.
  /// In JSON format, the Duration type is encoded as a string rather than an
  /// object, where the string ends in the suffix "s" (indicating seconds) and
  /// is preceded by the number of seconds, with nanoseconds expressed as
  /// fractional seconds. For example, 3 seconds with 0 nanoseconds should be
  /// encoded in JSON format as "3s", while 3 seconds and 1 nanosecond should
  /// be expressed in JSON format as "3.000000001s". The ttl will be rounded
  /// down
  /// to the nearest second.
  @nullable
  String get ttl;

  /// If set to true, messages will be allowed to be delivered to the app while
  /// the device is in direct boot mode.
  /// See [https://developer.android.com/training/articles/direct-boot].
  @nullable
  bool get direct_boot_ok;

  AndroidConfig._();
  factory AndroidConfig([void Function(AndroidConfigBuilder) updates]) = _$AndroidConfig;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AndroidConfig.serializer, this);
  }

  static AndroidConfig fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AndroidConfig.serializer, json);
  }

  static Serializer<AndroidConfig> get serializer => _$androidConfigSerializer;
}