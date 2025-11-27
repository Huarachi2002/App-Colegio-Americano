import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AbsencesResponse.g.dart';

abstract class AbsencesResponse
    implements Built<AbsencesResponse, AbsencesResponseBuilder> {
  AbsencesResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'start_time')
  int get startTime;

  @BuiltValueField(wireName: 'end_time')
  int get endTime;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'time')
  int get time;

  @BuiltValueField(wireName: 'group')
  String get absenceGroup;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(AbsencesResponseBuilder absencesResponseBuilder) =>
      absencesResponseBuilder..absenceGroup = 'N/A';

  factory AbsencesResponse(
          [updates(AbsencesResponseBuilder absencesResponseBuilder)]) =
      _$AbsencesResponse;

  static Serializer<AbsencesResponse> get serializer =>
      _$absencesResponseSerializer;
}
