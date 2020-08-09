import 'package:flutter_project_boilerplate/core/api/response/response_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_device_response.g.dart';

@JsonSerializable(createToJson: true)
class RegisterDeviceResponse extends ResponseObject {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'registration_id')
  final String registrationId;

  @JsonKey(name: 'device_id')
  final String deviceId;

  @JsonKey(name: 'active')
  final bool active;

  @JsonKey(name: 'date_created')
  final String dateCreated;

  @JsonKey(name: 'type')
  final String type;

  RegisterDeviceResponse({this.id, this.type, this.name, this.active, this.dateCreated, this.deviceId, this.registrationId});

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseFromJson(json);

  static get serializer => _$RegisterDeviceResponseFromJson;

  Map toJson() {
    return _$RegisterDeviceResponseToJson(this);
  }
}