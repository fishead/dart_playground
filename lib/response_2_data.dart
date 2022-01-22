import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'response_2_data.g.dart';

abstract class Response2Data
    implements Built<Response2Data, Response2DataBuilder> {
  String get field1;

  Response2Data._();

  factory Response2Data([void Function(Response2DataBuilder) updates]) =
      _$Response2Data;

  static Serializer<Response2Data> get serializer => _$response2DataSerializer;

  factory Response2Data.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Response2Data.serializer,
      json.decode(jsonString),
    ) as Response2Data;
  }
}
