// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AndroidConfig> _$androidConfigSerializer =
    new _$AndroidConfigSerializer();

class _$AndroidConfigSerializer implements StructuredSerializer<AndroidConfig> {
  @override
  final Iterable<Type> types = const [AndroidConfig, _$AndroidConfig];
  @override
  final String wireName = 'AndroidConfig';

  @override
  Iterable<Object> serialize(Serializers serializers, AndroidConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.collapseKey != null) {
      result
        ..add('collapseKey')
        ..add(serializers.serialize(object.collapseKey,
            specifiedType: const FullType(String)));
    }
    if (object.directBootOk != null) {
      result
        ..add('directBootOk')
        ..add(serializers.serialize(object.directBootOk,
            specifiedType: const FullType(bool)));
    }
    if (object.fcmOptions != null) {
      result
        ..add('fcmOptions')
        ..add(serializers.serialize(object.fcmOptions,
            specifiedType: const FullType(AndroidFcmOptions)));
    }
    if (object.priority != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(object.priority,
            specifiedType: const FullType(String)));
    }
    if (object.restrictedPackageName != null) {
      result
        ..add('restrictedPackageName')
        ..add(serializers.serialize(object.restrictedPackageName,
            specifiedType: const FullType(String)));
    }
    if (object.ttl != null) {
      result
        ..add('ttl')
        ..add(serializers.serialize(object.ttl,
            specifiedType: const FullType(String)));
    }
    if (object.direct_boot_ok != null) {
      result
        ..add('direct_boot_ok')
        ..add(serializers.serialize(object.direct_boot_ok,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  AndroidConfig deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AndroidConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'collapseKey':
          result.collapseKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'directBootOk':
          result.directBootOk = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'fcmOptions':
          result.fcmOptions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AndroidFcmOptions))
              as AndroidFcmOptions);
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'restrictedPackageName':
          result.restrictedPackageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ttl':
          result.ttl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'direct_boot_ok':
          result.direct_boot_ok = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AndroidConfig extends AndroidConfig {
  @override
  final String collapseKey;
  @override
  final bool directBootOk;
  @override
  final AndroidFcmOptions fcmOptions;
  @override
  final String priority;
  @override
  final String restrictedPackageName;
  @override
  final String ttl;
  @override
  final bool direct_boot_ok;

  factory _$AndroidConfig([void Function(AndroidConfigBuilder) updates]) =>
      (new AndroidConfigBuilder()..update(updates)).build();

  _$AndroidConfig._(
      {this.collapseKey,
      this.directBootOk,
      this.fcmOptions,
      this.priority,
      this.restrictedPackageName,
      this.ttl,
      this.direct_boot_ok})
      : super._();

  @override
  AndroidConfig rebuild(void Function(AndroidConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AndroidConfigBuilder toBuilder() => new AndroidConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AndroidConfig &&
        collapseKey == other.collapseKey &&
        directBootOk == other.directBootOk &&
        fcmOptions == other.fcmOptions &&
        priority == other.priority &&
        restrictedPackageName == other.restrictedPackageName &&
        ttl == other.ttl &&
        direct_boot_ok == other.direct_boot_ok;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, collapseKey.hashCode),
                            directBootOk.hashCode),
                        fcmOptions.hashCode),
                    priority.hashCode),
                restrictedPackageName.hashCode),
            ttl.hashCode),
        direct_boot_ok.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AndroidConfig')
          ..add('collapseKey', collapseKey)
          ..add('directBootOk', directBootOk)
          ..add('fcmOptions', fcmOptions)
          ..add('priority', priority)
          ..add('restrictedPackageName', restrictedPackageName)
          ..add('ttl', ttl)
          ..add('direct_boot_ok', direct_boot_ok))
        .toString();
  }
}

class AndroidConfigBuilder
    implements Builder<AndroidConfig, AndroidConfigBuilder> {
  _$AndroidConfig _$v;

  String _collapseKey;
  String get collapseKey => _$this._collapseKey;
  set collapseKey(String collapseKey) => _$this._collapseKey = collapseKey;

  bool _directBootOk;
  bool get directBootOk => _$this._directBootOk;
  set directBootOk(bool directBootOk) => _$this._directBootOk = directBootOk;

  AndroidFcmOptionsBuilder _fcmOptions;
  AndroidFcmOptionsBuilder get fcmOptions =>
      _$this._fcmOptions ??= new AndroidFcmOptionsBuilder();
  set fcmOptions(AndroidFcmOptionsBuilder fcmOptions) =>
      _$this._fcmOptions = fcmOptions;

  String _priority;
  String get priority => _$this._priority;
  set priority(String priority) => _$this._priority = priority;

  String _restrictedPackageName;
  String get restrictedPackageName => _$this._restrictedPackageName;
  set restrictedPackageName(String restrictedPackageName) =>
      _$this._restrictedPackageName = restrictedPackageName;

  String _ttl;
  String get ttl => _$this._ttl;
  set ttl(String ttl) => _$this._ttl = ttl;

  bool _direct_boot_ok;
  bool get direct_boot_ok => _$this._direct_boot_ok;
  set direct_boot_ok(bool direct_boot_ok) =>
      _$this._direct_boot_ok = direct_boot_ok;

  AndroidConfigBuilder();

  AndroidConfigBuilder get _$this {
    if (_$v != null) {
      _collapseKey = _$v.collapseKey;
      _directBootOk = _$v.directBootOk;
      _fcmOptions = _$v.fcmOptions?.toBuilder();
      _priority = _$v.priority;
      _restrictedPackageName = _$v.restrictedPackageName;
      _ttl = _$v.ttl;
      _direct_boot_ok = _$v.direct_boot_ok;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AndroidConfig other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AndroidConfig;
  }

  @override
  void update(void Function(AndroidConfigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AndroidConfig build() {
    _$AndroidConfig _$result;
    try {
      _$result = _$v ??
          new _$AndroidConfig._(
              collapseKey: collapseKey,
              directBootOk: directBootOk,
              fcmOptions: _fcmOptions?.build(),
              priority: priority,
              restrictedPackageName: restrictedPackageName,
              ttl: ttl,
              direct_boot_ok: direct_boot_ok);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fcmOptions';
        _fcmOptions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AndroidConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
