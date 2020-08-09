import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/api/clients/general_client.dart';
import 'package:flutter_project_boilerplate/core/controllers/session_controller.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';

class Api {
  final GeneralClient generalClient;

  Api({
    @required this.generalClient,
  });

  factory Api.create({
    @required String apiKey,
    @required String baseUrl,
    @required Logger logger,
    @required SessionController sessionController,
  }) {
    return Api(
        generalClient: GeneralClient(
            apiKey: apiKey,
            baseUrl: baseUrl,
            logger: logger,
            sessionController: sessionController
        ),
        // add more clients here
    );
  }
}
