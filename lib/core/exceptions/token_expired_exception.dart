// An exception thrown manually by ourselves. Contains a description of what's going plus the inner exception.

import 'package:flutter_project_boilerplate/core/exceptions/user_friendly_exception.dart';

class TokenExpiredException implements UserFriendlyException {
  String detail = "Your session has expired, please login again!";
  int code = 401;
  dynamic innerException;

  String getUserFriendlyMessage() {
    return detail;
  }

  @override
  String toString() {
    return getUserFriendlyMessage();
  }

  @override
  int getCode() {
    return code;
  }
}
