import 'dart:convert';

import 'package:dart_playground/payload_with_optional_meta.dart';
import 'package:dart_playground/payload_with_meta.dart';
import 'package:dart_playground/response_1_data.dart';
import 'package:dart_playground/response_2_data.dart';
import 'package:dart_playground/response_2_meta.dart';

void main(List<String> arguments) {
  final encodedResponse1 = jsonEncode({
    "data": {
      "field1": "response 1 field 1",
    }
  });
  final encodedResponse2 = jsonEncode({
    "meta": {
      "reason": "cause i can",
    },
    "data": {
      "field1": "response 2 field 1",
    }
  });

  try {
    final response1 = PayloadWithOptionalMeta<Response1Data, Never>.fromJson(
        encodedResponse1);
    print("decode response1 with PayloadWithOptionalMeta.");
    print("\tresponse1.data.field1: ${response1.data.field1}");
  } catch (e) {
    print(e);
  }

  try {
    final response2 =
        PayloadWithOptionalMeta<Response2Data, Response2Meta>.fromJson(
            encodedResponse2);
    print("decode response2 with PayloadWithOptionalMeta.");
    print("\tresponse2.meta.reason: ${response2.meta?.reason}");
    print("\tresponse2.data.field1: ${response2.data.field1}");
  } catch (e) {
    print(e);
  }

  try {
    final response2 = PayloadWithMeta<Response2Data, Response2Meta>.fromJson(
        encodedResponse2);
    print("decode response2 with PayloadWithMeta.");
    print("\tresponse2.meta.reason: ${response2.meta.reason}");
    print("\tresponse2.data.field1: ${response2.data.field1}");
  } catch (e) {
    print(e);
  }
}
