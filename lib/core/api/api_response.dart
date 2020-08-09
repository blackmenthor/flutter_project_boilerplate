import 'package:flutter/material.dart';

class ApiResponse {
  int statusCode;
  Map<String, dynamic> body;

  ApiResponse(int statusCode, Map<String, dynamic> body) {
    this.statusCode = statusCode;
    this.body = body;
  }

  bool wasSuccessful() {
    return statusCode >= 200 && statusCode < 300;
  }
}

class ApiResponseList {
  int statusCode;
  int count;
  String next;
  String previous;
  List<Map<String, dynamic>> body;

  ApiResponseList({
     @required
     this.statusCode,
     @required
     this.count,
     @required
     this.next,
     @required
     this.previous,
     @required
     this.body,
  });

  bool wasSuccessful() {
    return statusCode >= 200 && statusCode < 300;
  }
}
