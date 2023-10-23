import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voco_case_study/product/base/api_base_error.dart';

extension ResponseExt on http.Response {
  (Map<String, dynamic>?, ApiBaseError?) toMap() {
    try {
      if (statusCode >= 200 && statusCode < 300) {
        return (
          jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>,
          null
        );
      } else {
        return (
          null,
          ApiBaseError.fromJson(jsonDecode(body) as Map<String, dynamic>)
        );
      }
    } catch (e) {
      return (null, ApiBaseError(error: e.toString()));
    }
  }
}
