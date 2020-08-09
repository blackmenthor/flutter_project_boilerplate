
import 'package:flutter_project_boilerplate/core/logging/console.dart';
import 'package:flutter_project_boilerplate/core/logging/logging_level.dart';

abstract class LoggingIntegration {
  void log(String message, LoggingLevel level);
}

class Logger {

  factory Logger.create() {
    return Logger([
      ConsoleLoggingIntegration(),
    ]);
  }

  Logger(this._integrations);

  final List<LoggingIntegration> _integrations;

  void logVerbose(String message) {
    _log(message, LoggingLevel.verbose);
  }

  void logInfo(String message) {
    _log(message, LoggingLevel.info);
  }

  void logWarning(String message) {
    _log(message, LoggingLevel.warning);
  }

  void logError(String message) {
    _log(message, LoggingLevel.error);
  }

  void _log(String message, LoggingLevel level) {
    // First build the "final message" that will look like "[LogLevelPrefix] message"
    var finalMessage = "";
    final prefix = _getLogPrefix(level);
    if (prefix.isNotEmpty) {
      finalMessage += prefix;
      finalMessage += " ";
    }
    finalMessage += message;

    // Finally send that message to each integration
    _integrations.forEach((integration) {
      integration.log(finalMessage, level);
    });
  }

  // Returns the log prefix for the given LoggingLevel
  String _getLogPrefix(LoggingLevel level) {
    switch (level) {
      case LoggingLevel.verbose:
        return "";
      case LoggingLevel.info:
        return "[I]";
      case LoggingLevel.warning:
        return "[W]";
      case LoggingLevel.error:
        return "[E]";
    }

    return "";
  }
}