import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/Serializers.dart'
    show serializers;
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/utils/UtilDeserializer.dart';
import 'exception/ApiException.dart';

class ExternalBuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(request.copyWith(
        body: serializers.serializeWith(
            serializers.serializerForType(request.body.runtimeType)!,
            request.body)));
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, SingleItemType>(
      Response response) async {
    print(response.body);
    final Response result = await super.convertResponse(response);
    // A LA CHIT
    try {
      dynamic decodedResponse = json.decode(response.body);
      print(decodedResponse);
      dynamic convertedObject =
          UtilDeserializer.convertToCustomObject<SingleItemType>(null!);
      if (convertedObject is List) {
        convertedObject = convertedObject as BuiltList<SingleItemType>;
      }
      return result.copyWith<BodyType>(body: convertedObject as BodyType);
    } on Exception catch (exception) {
      print("A LA CHIT");
      print(exception);
      return null!;
    } catch (e) {
      print("A LA CHIT2");
      print(e);
      return null!;
    }
  }

  void _handleException(int code, String message) {
    if (code < 0) throw ApiException(code, message);
  }
}
