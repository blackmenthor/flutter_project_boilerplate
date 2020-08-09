import 'package:flutter_project_boilerplate/core/api/response/response_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable(createToJson: true)
class RegisterResponse extends ResponseObject {
  @JsonKey(name: 'refresh')
  final String refreshToken;

  @JsonKey(name: 'token')
  final String accessToken;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'id')
  final String id;

  RegisterResponse({this.refreshToken, this.accessToken, this.phoneNumber,
  this.firstName, this.lastName, this.email, this.id});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  static get serializer => _$RegisterResponseFromJson;

  Map toJson() {
    return _$RegisterResponseToJson(this);
  }
}