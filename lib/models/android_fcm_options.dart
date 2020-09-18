import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'android_fcm_options.g.dart';

abstract class AndroidFcmOptions implements Built<AndroidFcmOptions, AndroidFcmOptionsBuilder> {
  /// Label associated with the message's analytics data.
  String get analyticsLabel;

  AndroidFcmOptions._();
  factory AndroidFcmOptions([void Function(AndroidFcmOptionsBuilder) updates]) = _$AndroidFcmOptions;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AndroidFcmOptions.serializer, this);
  }

  static AndroidFcmOptions fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AndroidFcmOptions.serializer, json);
  }

  static Serializer<AndroidFcmOptions> get serializer => _$androidFcmOptionsSerializer;
}