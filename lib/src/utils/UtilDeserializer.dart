import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:colegio_americano/src/data/remote/Serializers.dart'
    show serializers;

class UtilDeserializer {
  static dynamic convertToCustomObject<SingleItemType>(dynamic element) {
    if (element is bool ||
        element is int ||
        element is String ||
        element == null) return element;
    if (element is List) return _deserializeListOf<SingleItemType>(element);
    return _deserialize<SingleItemType>(element as Map<String, dynamic>);
  }

  static BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(
      List dynamicList) {
    if (SingleItemType == String ||
        SingleItemType == int ||
        SingleItemType == bool)
      return BuiltList<SingleItemType>(dynamicList.map((element) => element));
    return BuiltList<SingleItemType>(
        dynamicList.map((element) => _deserialize<SingleItemType>(element)));
  }

  static SingleItemType _deserialize<SingleItemType>(
      Map<String, dynamic> value) {
    print("UtilDeserializer Type: $SingleItemType");
    print("UtilDeserializer Value: $value");
    final serializer = (serializers.serializerForType(SingleItemType)
        as Serializer<SingleItemType>);

    print("UtilDesearializer Result: $serializer");
    return serializers.deserializeWith<SingleItemType>(serializer, value)!;
  }
}
