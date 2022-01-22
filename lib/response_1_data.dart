import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'response_1_data.g.dart';

abstract class Response1Data
    implements Built<Response1Data, Response1DataBuilder> {
  String get field1;

  Response1Data._();

  factory Response1Data([void Function(Response1DataBuilder) updates]) =
      _$Response1Data;

  static Serializer<Response1Data> get serializer => _$response1DataSerializer;

  factory Response1Data.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Response1Data.serializer,
      json.decode(jsonString),
    ) as Response1Data;
  }
}
