// lib/core/utils/logger.dart
import 'package:logger/logger.dart';

abstract class ILogger {
  void info(String message);
  void debug(String message);
  void warning(String message);
  void trace(String message);
  void error(String message, [dynamic error, StackTrace? stackTrace]);
}

class AppLogger implements ILogger {
  final Logger _logger;

  AppLogger()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 5,
            lineLength: 80,
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
          ),
        );

  @override
  void info(String message, {StackTrace? stackTrace}) {
    _logger.i(message, stackTrace: stackTrace ?? StackTrace.empty);
  }

  @override
  void debug(String message, {StackTrace? stackTrace}) {
    _logger.d(message, stackTrace: stackTrace ?? StackTrace.empty);
  }

  @override
  void warning(String message, {StackTrace? stackTrace}) {
    _logger.w(message, stackTrace: stackTrace ?? StackTrace.empty);
  }

  @override
  void trace(String message, {StackTrace? stackTrace}) {
    _logger.t(message, stackTrace: stackTrace ?? StackTrace.empty);
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
