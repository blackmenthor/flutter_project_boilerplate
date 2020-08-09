import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/clients/auth_client.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/login_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/refresh_session_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/register_device_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/request/auth/register_request_object.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/register_device_response.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';

class SessionController {
  final AuthClient authClient;
  final Logger logger;
  SessionResponse currentSession;
  String deviceToken;

  SessionController({
    @required this.authClient,
    @required this.logger,
  });

  setSession(SessionResponse sessionResponse) => currentSession = sessionResponse;
  setDeviceToken(String deviceToken) => this.deviceToken = deviceToken;

  String getToken() => currentSession?.accessToken;
  String getDeviceToken() => deviceToken;

  Future<SessionResponse> login(
      {@required String phoneNumber, @required String password}) async {
    final requestObject =
    LoginRequestObject(phoneNumber: phoneNumber, password: password);

    final session = await authClient.login(requestObject);
    currentSession = session;
    return session;
  }

  Future<SessionResponse> register(
      {
        @required String phoneNumber,
        @required String password,
        @required String firstName,
        @required String lastName,
        String email,
      }) async {
    final requestObject =
    RegisterRequestObject(
        phoneNumber: phoneNumber,
        password: password,
        firstName: firstName,
        lastName: lastName,
        email: email
    );

    final session = await authClient.register(requestObject);
    currentSession = session;
    return session;
  }

  Future<SessionResponse> refreshSession() async {
    final requestObject =
    RefreshSessionRequestObject(refreshToken: currentSession?.refreshToken);

    final session = await authClient.refreshToken(requestObject);
    session.user = currentSession?.user;
    currentSession = session;
    return session;
  }

  Future<RegisterDeviceResponse> registerDevice(String token, String accessToken) async {
    final requestObject =
    RegisterDeviceRequestObject(token: token);

    final session = await authClient.registerDevice(requestObject, accessToken);
    deviceToken = token;
    return session;
  }
}