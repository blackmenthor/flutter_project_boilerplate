import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/request/request_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_object.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestObject implements RequestObject {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'email')
  final String email;

  const RegisterRequestObject({
    @required this.phoneNumber,
    @required this.password,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
  });

  Map getJsonBody() {
    return _$RegisterRequestObjectToJson(this);
  }
}
