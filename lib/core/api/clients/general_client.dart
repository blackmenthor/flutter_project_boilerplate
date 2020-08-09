import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/api_client.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:flutter_project_boilerplate/core/controllers/session_controller.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';

class GeneralClient extends ApiClient {
  final SessionController sessionController;

  GeneralClient({
    @required String apiKey,
    @required String baseUrl,
    @required Logger logger,
    @required this.sessionController
  }) : super(apiKey, baseUrl, logger);

  // TODO: DELETE DUMMY API
  Future<SessionResponse> fetchDummy() async {
    final String endpoint = 'dummy';

    return get(
        endpoint: endpoint,
        token: sessionController.getToken(),
        serializer: SessionResponse.serializer);
  }

}
