// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) {
  return SessionResponse(
    refreshToken: json['refresh'] as String,
    accessToken: json['access'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    timeLogInInMillis: json['timeLogInInMillis'] as int,
  );
}

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refreshToken,
      'access': instance.accessToken,
      'user': instance.user,
      'timeLogInInMillis': instance.timeLogInInMillis,
    };
