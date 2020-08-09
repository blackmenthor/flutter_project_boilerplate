// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceResponse _$RegisterDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterDeviceResponse(
    id: json['id'] as int,
    type: json['type'] as String,
    name: json['name'] as String,
    active: json['active'] as bool,
    dateCreated: json['date_created'] as String,
    deviceId: json['device_id'] as String,
    registrationId: json['registration_id'] as String,
  );
}

Map<String, dynamic> _$RegisterDeviceResponseToJson(
        RegisterDeviceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'registration_id': instance.registrationId,
      'device_id': instance.deviceId,
      'active': instance.active,
      'date_created': instance.dateCreated,
      'type': instance.type,
    };
