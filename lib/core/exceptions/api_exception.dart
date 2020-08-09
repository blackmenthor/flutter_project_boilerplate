import 'package:flutter_project_boilerplate/core/api/api_error.dart';
import 'package:flutter_project_boilerplate/core/exceptions/user_friendly_exception.dart';

// An exception thrown when an Api response isn't successful. Can include an ApiError and the status code of the response.
class ApiException implements UserFriendlyException {
  ApiError error;
  int statusCode;

  ApiException(this.error, this.statusCode);

  String getUserFriendlyMessage() {
    return error.detail;
  }

  @override
  String toString() {
    return getUserFriendlyMessage();
  }

  @override
  int getCode() {
    return statusCode;
  }
}
