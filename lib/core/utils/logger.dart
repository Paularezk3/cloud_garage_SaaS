// lib/core/utils/logger.dart
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to display
      errorMethodCount: 5, // Number of method calls to display on error
      lineLength: 80, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print emojis for easier debugging
      dateTimeFormat:
          DateTimeFormat.onlyTimeAndSinceStart, // Print log timestamps
    ),
  );

  static void info(String message) {
    _logger.i(message);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
