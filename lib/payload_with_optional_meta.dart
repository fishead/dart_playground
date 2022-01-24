import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'payload_with_optional_meta.g.dart';

abstract class PayloadWithOptionalMeta<D, M>
    implements
        Built<PayloadWithOptionalMeta<D, M>,
            PayloadWithOptionalMetaBuilder<D, M>> {
  M? get meta;

  D get data;

  PayloadWithOptionalMeta._();

  factory PayloadWithOptionalMeta(
          [void Function(PayloadWithOptionalMetaBuilder<D, M>) updates]) =
      _$PayloadWithOptionalMeta<D, M>;

  static Serializer<PayloadWithOptionalMeta<Object?, Object?>> get serializer =>
      _$payloadWithOptionalMetaSerializer;

  factory PayloadWithOptionalMeta.fromJson(String jsonString) {
    final specifiedType =
        FullType(PayloadWithOptionalMeta, [FullType(D), FullType(M)]);
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: specifiedType,
    ) as PayloadWithOptionalMeta<D, M>;
  }
}
