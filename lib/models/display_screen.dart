import 'package:flutter/material.dart';

class DisplayScreen {
  static MediaQueryData? _mediaData;
  static double? displayWidth;
  static double? displayHeight;

  void init(BuildContext aContext) {
    _mediaData = MediaQuery.of(aContext);
    displayWidth = _mediaData?.size.width;
    displayHeight = _mediaData?.size.height;
  }

  Size get screenSize => _mediaData!.size;
}
