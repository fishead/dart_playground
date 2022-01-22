import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'payload.dart';
import 'response_1_data.dart';
import 'response_2_data.dart';
import 'response_2_meta.dart';

part 'serializers.g.dart';

@SerializersFor([
  Payload,
  Response1Data,
  Response2Data,
  Response2Meta,
])
final Serializers serializers = (_$serializers.toBuilder()
      // is it right to use `void`?
      ..addBuilderFactory(
        const FullType(
          Payload,
          [FullType(Response1Data)],
        ),
        () => PayloadBuilder<Response1Data, void>(),
      )
      ..addBuilderFactory(
        const FullType(
          Payload,
          [FullType(Response2Data), FullType(Response2Meta)],
        ),
        () => PayloadBuilder<Response2Data, Response2Meta>(),
      )
      ..addPlugin(StandardJsonPlugin()))
    .build();
