import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fcm_api/models/serializers.dart';

part 'notification.g.dart';

/// Basic notification template to use across all platforms.
/// WARNING: if you use notification, you won't be able to
/// receive the message in flutter. Use data instead.
abstract class Notification implements Built<Notification, NotificationBuilder> {
  /// The notification's body text.
  @nullable
  String get body;

  /// Contains the URL of an image that is going to be downloaded on the device
  /// and displayed in a notification.
  /// JPEG, PNG, BMP have full support across platforms. Animated GIF and video
  /// only work on iOS. WebP and HEIF have varying levels of support across
  /// platforms and platform versions.
  /// Android has 1MB image size limit.
  /// Quota usage and implications/costs for hosting image on Firebase Storage:
  /// https://firebase.google.com/pricing
  @nullable
  String get image;

  /// The notification's title.
  @nullable
  String get title;

  Notification._();

  factory Notification([void Function(NotificationBuilder) updates]) = _$Notification;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Notification.serializer, this);
  }

  static Notification fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Notification.serializer, json);
  }

  static Serializer<Notification> get serializer => _$notificationSerializer;
}
