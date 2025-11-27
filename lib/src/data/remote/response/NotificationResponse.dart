import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'NotificationResponse.g.dart';

abstract class NotificationResponse
    implements Built<NotificationResponse, NotificationResponseBuilder> {

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'attachment')
  String get url;

  NotificationResponse._();

  factory NotificationResponse([updates(
      NotificationResponseBuilder notificationResponseBuilder)]) = _$NotificationResponse;

  static Serializer<NotificationResponse> get serializer =>
      _$notificationResponseSerializer;
}