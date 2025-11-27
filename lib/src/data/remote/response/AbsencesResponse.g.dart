// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AbsencesResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AbsencesResponse> _$absencesResponseSerializer =
    new _$AbsencesResponseSerializer();

class _$AbsencesResponseSerializer
    implements StructuredSerializer<AbsencesResponse> {
  @override
  final Iterable<Type> types = const [AbsencesResponse, _$AbsencesResponse];
  @override
  final String wireName = 'AbsencesResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, AbsencesResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'start_time',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(int)),
      'end_time',
      serializers.serialize(object.endTime, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(int)),
      'group',
      serializers.serialize(object.absenceGroup,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AbsencesResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AbsencesResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'group':
          result.absenceGroup = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AbsencesResponse extends AbsencesResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final String type;
  @override
  final int time;
  @override
  final String absenceGroup;
  @override
  final String createdAt;

  factory _$AbsencesResponse(
          [void Function(AbsencesResponseBuilder)? updates]) =>
      (new AbsencesResponseBuilder()..update(updates))._build();

  _$AbsencesResponse._(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.type,
      required this.time,
      required this.absenceGroup,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AbsencesResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(date, r'AbsencesResponse', 'date');
    BuiltValueNullFieldError.checkNotNull(
        startTime, r'AbsencesResponse', 'startTime');
    BuiltValueNullFieldError.checkNotNull(
        endTime, r'AbsencesResponse', 'endTime');
    BuiltValueNullFieldError.checkNotNull(type, r'AbsencesResponse', 'type');
    BuiltValueNullFieldError.checkNotNull(time, r'AbsencesResponse', 'time');
    BuiltValueNullFieldError.checkNotNull(
        absenceGroup, r'AbsencesResponse', 'absenceGroup');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'AbsencesResponse', 'createdAt');
  }

  @override
  AbsencesResponse rebuild(void Function(AbsencesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AbsencesResponseBuilder toBuilder() =>
      new AbsencesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AbsencesResponse &&
        id == other.id &&
        date == other.date &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        type == other.type &&
        time == other.time &&
        absenceGroup == other.absenceGroup &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, absenceGroup.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AbsencesResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('type', type)
          ..add('time', time)
          ..add('absenceGroup', absenceGroup)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AbsencesResponseBuilder
    implements Builder<AbsencesResponse, AbsencesResponseBuilder> {
  _$AbsencesResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  int? _startTime;
  int? get startTime => _$this._startTime;
  set startTime(int? startTime) => _$this._startTime = startTime;

  int? _endTime;
  int? get endTime => _$this._endTime;
  set endTime(int? endTime) => _$this._endTime = endTime;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _time;
  int? get time => _$this._time;
  set time(int? time) => _$this._time = time;

  String? _absenceGroup;
  String? get absenceGroup => _$this._absenceGroup;
  set absenceGroup(String? absenceGroup) => _$this._absenceGroup = absenceGroup;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  AbsencesResponseBuilder() {
    AbsencesResponse._setDefaults(this);
  }

  AbsencesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _type = $v.type;
      _time = $v.time;
      _absenceGroup = $v.absenceGroup;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AbsencesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AbsencesResponse;
  }

  @override
  void update(void Function(AbsencesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AbsencesResponse build() => _build();

  _$AbsencesResponse _build() {
    final _$result = _$v ??
        new _$AbsencesResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AbsencesResponse', 'id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'AbsencesResponse', 'date'),
            startTime: BuiltValueNullFieldError.checkNotNull(
                startTime, r'AbsencesResponse', 'startTime'),
            endTime: BuiltValueNullFieldError.checkNotNull(
                endTime, r'AbsencesResponse', 'endTime'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'AbsencesResponse', 'type'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, r'AbsencesResponse', 'time'),
            absenceGroup: BuiltValueNullFieldError.checkNotNull(
                absenceGroup, r'AbsencesResponse', 'absenceGroup'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AbsencesResponse', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
