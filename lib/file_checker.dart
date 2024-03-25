import 'package:flutter/services.dart';

class FileChecker {
  static const MethodChannel _channel = MethodChannel('com.pythonista.filechecker');

  static Future<bool> checkFileExists(String path) async {
    final bool fileExists = await _channel.invokeMethod('checkFileExists', {'path': path});
    return fileExists;
  }
}
