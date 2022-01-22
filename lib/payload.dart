import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'payload.g.dart';

abstract class Payload<D, M>
    implements Built<Payload<D, M>, PayloadBuilder<D, M>> {
  M get meta;

  D get data;

  Payload._();

  factory Payload([void Function(PayloadBuilder<D, M>) updates]) =
      _$Payload<D, M>;

  static Serializer<Payload<Object?, Object?>> get serializer =>
      _$payloadSerializer;

  factory Payload.fromJson(String jsonString) {
    final specifiedType = FullType(Payload, [FullType(D), FullType(M)]);
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: specifiedType,
    ) as Payload<D, M>;
  }
}
