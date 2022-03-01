import 'dart:io';

import 'system_screen_capturer.dart';

class SystemScreenCapturerImplLinux extends SystemScreenCapturer {
  SystemScreenCapturerImplLinux();

  @override
  Future<void> capture({
    required String imagePath,
    bool silent = true,
    int xStart = -1,
    int yStart = -1,
    int xEnd = -1,
    int yEnd = -1,
  }) async {
    await Process.run(
      'gnome-screenshot',
      [
        '-a',
        '-f',
        imagePath,
      ],
    );
  }
}
