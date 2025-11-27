import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/PathResponse.dart';

part 'NewsResponse.g.dart';

abstract class NewsResponse
    implements Built<NewsResponse, NewsResponseBuilder> {
  NewsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'title_german')
  String get titleGerman;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'description_german')
  String get descriptionGerman;

  @BuiltValueField(wireName: 'erp_code')
  String? get erpCode;

  @BuiltValueField(wireName: 'erp_code2')
  String? get erpCode2;

  @BuiltValueField(wireName: 'path')
  String get path;

  @BuiltValueField(wireName: 'notifiable')
  bool get notifiable;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'news_type_id')
  int get newsTypeId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  @BuiltValueField(wireName: 'images')
  BuiltList<PathResponse>? get images;

  factory NewsResponse([updates(NewsResponseBuilder newsResponseBuilder)]) =
      _$NewsResponse;

  static Serializer<NewsResponse> get serializer => _$newsResponseSerializer;
}
