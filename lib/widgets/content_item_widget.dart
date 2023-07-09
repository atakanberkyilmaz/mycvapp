import 'package:flutter/material.dart';
import '../const.dart' as cons;
import '../utils.dart' as util;
import '../models/resume_content_model.dart';
import 'package:sizer/sizer.dart';
import 'package:animator/animator.dart';

class ContentItemWidget extends StatelessWidget {
  final ResumeContentModel resumeContent;
  final List<ResumeContentModel> contentList;

  ContentItemWidget({required Key? key, required this.contentList, required this.resumeContent}) : super(key: key);

  Widget _buildAnimationWidget(
      Widget aWidget, {
        double aOffsetY = 50.0,
        int aMilSecDuration = 1200,
      }) {
    return Animator(
      tweenMap: {
        'opacity': Tween<double>(begin: -3, end: 1),
        'motion': Tween<Offset>(begin: Offset(0, aOffsetY), end: Offset(0, 0)),
      },
      duration: Duration(milliseconds: aMilSecDuration),
      curve: Curves.easeInOut,
      cycles: 1,
      builder: (_, anim, __) => FadeTransition(
        opacity: anim.getAnimation('opacity'),
        child: Transform.translate(
          offset: anim.getValue('motion'),
          child: aWidget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                width: this.resumeContent.pictureWidth,
                height: util.displayHeight()! * 0.18,
                child: _buildAnimationWidget(
                  Image(image: AssetImage(this.resumeContent.picture), fit: BoxFit.contain, ),
                  aMilSecDuration: 1000,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: this.resumeContent.featureAreaPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimationWidget(
                Text(this.resumeContent.topic, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.bold)),
                aOffsetY: -50,
              ),
              SizedBox(height: this.resumeContent.contentSpace),
              _buildAnimationWidget(
                Text(
                  this.resumeContent.feature,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.3, fontSize: 10.0.sp, color: cons.cTextFeatureColor),
                ),
                aOffsetY: -50,
                aMilSecDuration: 1400,
              ),
              if (this.resumeContent.showSeparateLine)
                SizedBox(
                  height: util.displayHeight()! * 0.1,
                  width: util.displayWidth()! * 0.50,
                  child: _buildAnimationWidget(
                    Divider(thickness: 1, color: cons.cTextFeatureColor),
                    aOffsetY: -50,
                    aMilSecDuration: 1600,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
