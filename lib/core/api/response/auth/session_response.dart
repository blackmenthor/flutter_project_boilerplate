import 'package:flutter_project_boilerplate/core/api/response/response_object.dart';
import 'package:flutter_project_boilerplate/core/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_response.g.dart';

@JsonSerializable(createToJson: true)
class SessionResponse extends ResponseObject {
  @JsonKey(name: 'refresh')
  final String refreshToken;

  @JsonKey(name: 'access')
  final String accessToken;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'timeLogInInMillis')
  int timeLogInInMillis;

  SessionResponse({this.refreshToken, this.accessToken, this.user, this.timeLogInInMillis});

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  static get serializer => _$SessionResponseFromJson;

  Map toJson() {
    return _$SessionResponseToJson(this);
  }
}