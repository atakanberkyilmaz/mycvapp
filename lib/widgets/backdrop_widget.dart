import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../const.dart' as cons;
import '../utils.dart' as util;
import '../models/resume_content_model.dart';

class BackdropWidget extends StatelessWidget {
  final ResumeContentModel resumeContent;
  final List<ResumeContentModel> contentList;

  BackdropWidget({required Key? key, required this.contentList, required this.resumeContent}) : super(key: key);

  List<Widget> _buildNavigatorDot() {
    var list = <Widget>[];
    for (int i = 0; i < this.contentList.length; i++) {
      list.add(
        Container(
          alignment: Alignment.center,
          width: 11,
          height: 11,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (this.contentList.indexOf(this.resumeContent) == i) ? this.resumeContent.viewColor : null,
            border: Border.all(color: this.contentList[i].viewColor),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: this.resumeContent.iconWidth,
                      child: Image(
                        image: AssetImage(this.resumeContent.iconImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ),
              Container(
                width: util.displayWidth()! * 0.38,
                height: util.displayHeight()! * 0.20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [this.resumeContent.beginGradient, this.resumeContent.endGradient],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 1.0],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 20,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildNavigatorDot(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              color: this.resumeContent.viewColor,
              height: util.displayHeight()! * 0.07,
              alignment: Alignment.center,
              child: Text(
                this.resumeContent.label,
                style: TextStyle(
                  fontSize: 10.0.sp,
                  fontWeight: FontWeight.bold,
                  color: cons.cTextLabelColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
