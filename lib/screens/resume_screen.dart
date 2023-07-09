import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils.dart' as util;
import '../const.dart' as cons;
import '../models/display_screen.dart';
import '../widgets/backdrop_widget.dart';
import '../widgets/content_item_widget.dart';
import '../widgets/content_transformer.dart';

class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var _currentIndex = cons.cStartingIndex;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    DisplayScreen().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: util.displayHeight()! * 0.12,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Atakan Berk Yılmaz',
                    style: TextStyle(
                      fontSize: cons.cCaptionTextSize,
                      fontWeight: FontWeight.bold,
                      color: cons.cTextFeatureColor,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: util.displayHeight()! * 0.05,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Flutter and React Native Dev',
                        style: TextStyle(
                          fontSize: cons.cCaptionTextSize,
                          fontWeight: FontWeight.bold,
                          color: cons.cTextFeatureColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: util.displayHeight()! * 0.025,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          onPressed: () => _launchURL('https://www.linkedin.com/in/atakanberkyilmazz/'), // Replace with your LinkedIn URL
                          color: cons.cTextFeatureColor,  // Adjust the color as per your needs
                          iconSize: 24.0, // Adjust the size as per your needs
                        ),
                        SizedBox(width: 10), // Add space between the icons
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          onPressed: () => _launchURL('https://github.com/atakanberkyilmaz'), // Replace with your GitHub URL
                          color: cons.cTextFeatureColor,  // Adjust the color as per your needs
                          iconSize: 24.0, // Adjust the size as per your needs
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      BackdropWidget(contentList: util.contentList, resumeContent: util.contentList[_currentIndex], key: null,),
                      _buildResumePage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResumePage() {
    return Container(
      child: TransformerPageView(
        itemCount: util.contentList.length,
        scrollDirection: Axis.vertical,
        transformer: ContentTransformer(),
        itemBuilder: (context, id) =>
            ContentItemWidget(contentList: util.contentList, resumeContent: util.contentList[id], key: null,),
        onPageChanged: (currID) {
          setState(() {
            _currentIndex = currID;
          });
        },
      ),
    );
  }
}
