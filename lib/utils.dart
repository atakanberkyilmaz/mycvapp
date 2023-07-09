import './const.dart' as cons;
import './models/resume_content_model.dart';
import './models/display_screen.dart';

double? displayWidth() => DisplayScreen.displayWidth;
double? displayHeight() => DisplayScreen.displayHeight;

final List<ResumeContentModel> contentList = [
  // Profile item
  ResumeContentModel(
    cons.cProfileTopic,
    cons.cProfileFeature,
    cons.cProfileLabel,
    cons.cProfilePicture,
    cons.cProfileIconImage,
    cons.cProfileColor,
    cons.cProfileBegColor,
    cons.cProfileEndColor,
    displayWidth()! * 0.26,
    42,
    displayHeight()! * 0.02,
    26,
  ),
  // Education item
  ResumeContentModel(
    cons.cEducationTopic,
    cons.cEducationFeature,
    cons.cEducationLabel,
    cons.cEducationPicture,
    cons.cEducationIconImage,
    cons.cEducationColor,
    cons.cEduBegColor,
    cons.cEduEndColor,
    displayWidth()! * 0.30,
    20,
    displayHeight()! * 0.05,
    34,
    showSeparateLine: true,
  ),

  // Experience item
  ResumeContentModel(
    cons.cExperienceTopic,
    cons.cExperienceFeature,
    cons.cExperienceLabel,
    cons.cExperiencePicture,
    cons.cExperienceIconImage,
    cons.cExperienceColor,
    cons.cExpBegColor,
    cons.cExpEndColor,
    displayWidth()! * 0.30,
    42,
    displayHeight()! * 0.02,
    38,
  ),
];
