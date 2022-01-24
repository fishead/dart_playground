import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'payload_with_meta.dart';
import 'payload_with_optional_meta.dart';
import 'response_1_data.dart';
import 'response_2_data.dart';
import 'response_2_meta.dart';

part 'serializers.g.dart';

@SerializersFor([
  PayloadWithMeta,
  PayloadWithOptionalMeta,
  Response1Data,
  Response2Data,
  Response2Meta,
])
final Serializers serializers = (_$serializers.toBuilder()
      // for `response1`
      // is it right to use `void`?
      ..addBuilderFactory(
        FullType(
          PayloadWithOptionalMeta,
          [FullType(Response1Data), FullType(Never)],
        ),
        () => PayloadWithOptionalMetaBuilder<Response1Data, Never>(),
      )

      // for `response2`
      ..addBuilderFactory(
        const FullType(
          PayloadWithOptionalMeta,
          [FullType(Response2Data), FullType(Response2Meta)],
        ),
        () => PayloadWithOptionalMetaBuilder<Response2Data, Response2Meta>(),
      )

      // for `response2`
      ..addBuilderFactory(
        const FullType(
          PayloadWithMeta,
          [FullType(Response2Data), FullType(Response2Meta)],
        ),
        () => PayloadWithMetaBuilder<Response2Data, Response2Meta>(),
      )
      ..addPlugin(StandardJsonPlugin()))
    .build();
