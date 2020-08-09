import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/api_client.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/login_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/refresh_session_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/register_device_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/register_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/register_device_response.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/register_response.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';
import 'package:flutter_project_boilerplate/core/models/user.dart';

class AuthClient extends ApiClient {
  AuthClient({
    @required String apiKey,
    @required String baseUrl,
    @required Logger logger,
  }) : super(apiKey, baseUrl, logger);

  Future<SessionResponse> login(
      LoginRequestObject requestObject) async {
    final String endpoint = 'auth/token/';

    return await post(
        endpoint: endpoint,
        body: requestObject.getJsonBody(),
        serializer: SessionResponse.serializer);
  }

  Future<SessionResponse> register(
      RegisterRequestObject requestObject) async {
    final String endpoint = 'auth/users/';

    RegisterResponse response =  await post(
        endpoint: endpoint,
        body: requestObject.getJsonBody(),
        serializer: RegisterResponse.serializer);

    SessionResponse sessionResponse = SessionResponse(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      user: User(
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
        phoneNumber: response.phoneNumber,
        id: response.id
      )
    );

    return sessionResponse;
  }

  Future<SessionResponse> refreshToken(
      RefreshSessionRequestObject requestObject) async {
    final String endpoint = 'auth/token/refresh/';

    return await post(
        endpoint: endpoint,
        body: requestObject.getJsonBody(),
        serializer: SessionResponse.serializer);
  }

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequestObject requestObject, String token) async {
    final String endpoint = 'devices';

    return await post(
        endpoint: endpoint,
        body: requestObject.getJsonBody(),
        token: token,
        serializer: RegisterDeviceResponse.serializer);
  }
}
