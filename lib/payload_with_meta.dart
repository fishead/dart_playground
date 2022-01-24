import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'payload_with_meta.g.dart';

abstract class PayloadWithMeta<D, M>
    implements Built<PayloadWithMeta<D, M>, PayloadWithMetaBuilder<D, M>> {
  M get meta;

  D get data;

  PayloadWithMeta._();

  factory PayloadWithMeta(
          [void Function(PayloadWithMetaBuilder<D, M>) updates]) =
      _$PayloadWithMeta<D, M>;

  static Serializer<PayloadWithMeta<Object?, Object?>> get serializer =>
      _$payloadWithMetaSerializer;

  factory PayloadWithMeta.fromJson(String jsonString) {
    final specifiedType = FullType(PayloadWithMeta, [FullType(D), FullType(M)]);
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: specifiedType,
    ) as PayloadWithMeta<D, M>;
  }
}
