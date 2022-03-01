import 'dart:io';

import 'system_screen_capturer.dart';

class SystemScreenCapturerImplMacOS extends SystemScreenCapturer {
  SystemScreenCapturerImplMacOS();

  @override
  Future<void> capture({
    required String imagePath,
    bool silent = true,
    int xStart = -1,
    int yStart = -1,
    int xEnd = -1,
    int yEnd = -1,

  }) async {
    List<String> arguments = [
      (yStart > -1 && yEnd > -1 && xStart > -1 && xEnd > -1) ? "-R $xStart,$yStart,$xEnd,$yEnd" : "",
      '-r',
      silent ? '-x' : '',
      imagePath,
    ];
    arguments.removeWhere((e) => e.isEmpty);

    await Process.run(
      '/usr/sbin/screencapture',
      arguments,
    );
  }
}
