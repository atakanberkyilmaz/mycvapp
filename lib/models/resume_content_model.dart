import 'package:flutter/cupertino.dart';

class ResumeContentModel {
  ResumeContentModel(
      this.topic,
      this.feature,
      this.label,
      this.picture,
      this.iconImage,
      this.viewColor,
      this.beginGradient,
      this.endGradient,
      this.pictureWidth,
      this.featureAreaPadding,
      this.contentSpace,
      this.iconWidth, {
        this.showSeparateLine = false,
      }) : super();
  final String topic;
  final String feature;
  final String label;
  final String picture;
  final String iconImage;
  final Color viewColor;
  final Color beginGradient;
  final Color endGradient;
  final double pictureWidth;
  final double featureAreaPadding;
  final double contentSpace;
  final double iconWidth;
  final bool showSeparateLine;
}
