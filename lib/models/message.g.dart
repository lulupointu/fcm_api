// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Message> _$messageSerializer = new _$MessageSerializer();

class _$MessageSerializer implements StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message, _$Message];
  @override
  final String wireName = 'Message';

  @override
  Iterable<Object> serialize(Serializers serializers, Message object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.android != null) {
      result
        ..add('android')
        ..add(serializers.serialize(object.android,
            specifiedType: const FullType(AndroidConfig)));
    }
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(String)])));
    }
    if (object.notification != null) {
      result
        ..add('notification')
        ..add(serializers.serialize(object.notification,
            specifiedType: const FullType(Notification)));
    }
    return result;
  }

  @override
  Message deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'android':
          result.android.replace(serializers.deserialize(value,
              specifiedType: const FullType(AndroidConfig)) as AndroidConfig);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)])));
          break;
        case 'notification':
          result.notification.replace(serializers.deserialize(value,
              specifiedType: const FullType(Notification)) as Notification);
          break;
      }
    }

    return result.build();
  }
}

class _$Message extends Message {
  @override
  final String name;
  @override
  final String token;
  @override
  final AndroidConfig android;
  @override
  final BuiltMap<String, String> data;
  @override
  final Notification notification;

  factory _$Message([void Function(MessageBuilder) updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._(
      {this.name, this.token, this.android, this.data, this.notification})
      : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('Message', 'token');
    }
  }

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        name == other.name &&
        token == other.token &&
        android == other.android &&
        data == other.data &&
        notification == other.notification;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), token.hashCode), android.hashCode),
            data.hashCode),
        notification.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('name', name)
          ..add('token', token)
          ..add('android', android)
          ..add('data', data)
          ..add('notification', notification))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  AndroidConfigBuilder _android;
  AndroidConfigBuilder get android =>
      _$this._android ??= new AndroidConfigBuilder();
  set android(AndroidConfigBuilder android) => _$this._android = android;

  MapBuilder<String, String> _data;
  MapBuilder<String, String> get data =>
      _$this._data ??= new MapBuilder<String, String>();
  set data(MapBuilder<String, String> data) => _$this._data = data;

  NotificationBuilder _notification;
  NotificationBuilder get notification =>
      _$this._notification ??= new NotificationBuilder();
  set notification(NotificationBuilder notification) =>
      _$this._notification = notification;

  MessageBuilder();

  MessageBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _token = _$v.token;
      _android = _$v.android?.toBuilder();
      _data = _$v.data?.toBuilder();
      _notification = _$v.notification?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    _$Message _$result;
    try {
      _$result = _$v ??
          new _$Message._(
              name: name,
              token: token,
              android: _android?.build(),
              data: _data?.build(),
              notification: _notification?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'android';
        _android?.build();
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'notification';
        _notification?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Message', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
