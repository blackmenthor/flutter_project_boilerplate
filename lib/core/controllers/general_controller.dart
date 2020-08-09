import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/clients/general_client.dart';
import 'package:flutter_project_boilerplate/core/api/response/auth/session_response.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';

class GeneralController {
  final GeneralClient generalClient;
  final Logger logger;

  GeneralController({
    @required this.generalClient,
    @required this.logger,
  });

  Future<SessionResponse> fetchDummy() {
    return generalClient.fetchDummy();
  }

}