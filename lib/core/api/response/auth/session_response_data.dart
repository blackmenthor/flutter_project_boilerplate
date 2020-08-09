import 'package:flutter_project_boilerplate/core/api/response/response_object.dart';
import 'package:flutter_project_boilerplate/core/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_response_data.g.dart';

@JsonSerializable(createToJson: false)
class SessionResponseData extends ResponseObject {
  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'token')
  final String token;

  SessionResponseData({this.user, this.token});

  factory SessionResponseData.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseDataFromJson(json);

  static get serializer => _$SessionResponseDataFromJson;
}