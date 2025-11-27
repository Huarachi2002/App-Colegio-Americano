import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/Serializers.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/utils/UtilDeserializer.dart';
import 'exception/ApiException.dart';

class LicenseBuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    print("Request Licences: ${request.body}");
    return super.convertRequest(request.copyWith(
        body: serializers.serializeWith(
            serializers.serializerForType(request.body.runtimeType)!,
            request.body)));
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, SingleItemType>(Response response) async {
    try {
      print("Response Licences: ${response.body}");
      final Response result = await super.convertResponse(response);
      final decodedResponse = json.decode(utf8.decode(response.bodyBytes));
      dynamic dataResponse = decodedResponse;
      dynamic convertedObject =
          UtilDeserializer.convertToCustomObject<SingleItemType>(dataResponse);
      return result.copyWith<BodyType>(body: convertedObject as BodyType);
    } catch (e) {
      print("[LICENSE CONVERTER] Exception: $e");
      throw e;
    }
  }

  void _handleException(int code, String message) {
    print("error");
    if (code < 0) throw ApiException(code, message);
  }
}
