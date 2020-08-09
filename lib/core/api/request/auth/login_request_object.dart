import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/request/request_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_object.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequestObject implements RequestObject {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'password')
  final String password;

  const LoginRequestObject({
    @required this.phoneNumber,
    @required this.password
  });

  Map getJsonBody() {
    return _$LoginRequestObjectToJson(this);
  }
}
