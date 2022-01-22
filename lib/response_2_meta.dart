import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'response_2_meta.g.dart';

abstract class Response2Meta
    implements Built<Response2Meta, Response2MetaBuilder> {
  String get reason;

  Response2Meta._();

  factory Response2Meta([void Function(Response2MetaBuilder) updates]) =
      _$Response2Meta;

  static Serializer<Response2Meta> get serializer => _$response2MetaSerializer;

  factory Response2Meta.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Response2Meta.serializer,
      json.decode(jsonString),
    ) as Response2Meta;
  }
}
