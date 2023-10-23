// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'api_base_error.g.dart';

@JsonSerializable()
class ApiBaseError {
  String? error;

  ApiBaseError({
    this.error,
  });

  factory ApiBaseError.fromJson(Map<String, dynamic> json) {
    return _$ApiBaseErrorFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApiBaseErrorToJson(this);
  }

  ApiBaseError copyWith({
    String? error,
  }) {
    return ApiBaseError(
      error: error ?? this.error,
    );
  }
}
