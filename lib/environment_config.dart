import 'package:flutter/material.dart';

enum Environment {
  PRODUCTION,
  STAGING, // Add more env. here if necessary
}

class EnvironmentConfig {
  const EnvironmentConfig({
    @required this.appName,
    @required this.environment,
    @required this.apiUrl,
    @required this.apiKey,
  });

  final String appName;
  final Environment environment;
  final String apiUrl;
  final String apiKey;

}