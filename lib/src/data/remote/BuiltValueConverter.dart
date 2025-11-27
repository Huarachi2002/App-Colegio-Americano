import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/Serializers.dart'
    show serializers;
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/utils/UtilDeserializer.dart';
import 'exception/ApiException.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    print("Request: ${request.body}");

    final serialized = serializers.serializeWith(
        serializers.serializerForType(request.body.runtimeType)!, request.body);

    final jsonString = json.encode(serialized);

    return request.copyWith(
        body: jsonString,
        headers: {...request.headers, 'content-type': 'application/json'});
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, SingleItemType>(
      Response response) async {
    print("Response: ${response.body}");
    final Response result = await super.convertResponse(response);
    Map<String, dynamic> decodedResponse = json.decode(response.body);
    _handleException(decodedResponse['code'], decodedResponse['message']);
    dynamic dataResponse = decodedResponse['data'];
    dynamic convertedObject =
        UtilDeserializer.convertToCustomObject<SingleItemType>(dataResponse);

    ApiResponse apiResponse = dataResponse is List
        ? ApiResponse<BuiltList<SingleItemType>>((apiResponse) => apiResponse
          ..code = decodedResponse['code']
          ..message = decodedResponse['message']
          ..data = convertedObject)
        : ApiResponse<SingleItemType>((apiResponse) => apiResponse
          ..code = decodedResponse['code']
          ..message = decodedResponse['message']
          ..data = convertedObject);

    return result.copyWith<BodyType>(body: apiResponse as BodyType);
  }

  void _handleException(int code, String message) {
    if (code < 0) throw ApiException(code, message);
  }
}
