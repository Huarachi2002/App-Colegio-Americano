import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ApiResponse.g.dart';

abstract class ApiResponse<T>
    implements Built<ApiResponse<T>, ApiResponseBuilder<T>> {

  int get code;

  String get message;

  T? get data;

  ApiResponse._();

  factory ApiResponse(
      [void Function(ApiResponseBuilder<T>) updates]) = _$ApiResponse<T>;

  static Serializer<ApiResponse> get serializer => _$apiResponseSerializer;
}