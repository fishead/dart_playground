import 'dart:convert';

import 'package:dart_playground/payload.dart';
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
    final response1 = Payload<Response1Data, void>.fromJson(encodedResponse1);
    print("response1.data.field1: ${response1.data.field1}");
  } catch (e) {
    print(e);
  }

  try {
    final response2 =
        Payload<Response2Data, Response2Meta>.fromJson(encodedResponse2);
    print("response2.meta.reason: ${response2.meta.reason}");
    print("response2.data.field1: ${response2.data.field1}");
  } catch (e) {
    print(e);
  }
}
