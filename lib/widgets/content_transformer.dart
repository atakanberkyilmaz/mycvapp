import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class ContentTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ContentTransformer({double aFade: 0.000001, double aScale: 0.000001})
      : _fade = aFade,
        _scale = aScale;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double scaleFac = (1 - position.abs()) * (1 - _scale);
    double fadeFac = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFac;
    double scale = _scale + scaleFac;
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }
}
