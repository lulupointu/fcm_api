library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'android_config.dart';
import 'android_fcm_options.dart';
import 'message.dart';
import 'notification.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Notification,
  Message,
  AndroidConfig,
  AndroidFcmOptions,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
