import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class InfoUpper extends StatelessWidget {

  final String title;
  final String subtitle;
  final String image;

  const InfoUpper({@required this.title, this.subtitle=' ', this.image=' '});

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: screenSize.screenWidth(72.5),
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: screenSize.screenHight(13.0),),
        Text(title,style: TextStyle(fontSize: 25.0,color: Color(0xff1749A2),fontWeight: FontWeight.w700,fontFamily: 'bahnschrift'),),
        SizedBox(height: screenSize.screenHight(5.0),),
        Text(subtitle,style: TextStyle(fontSize: 18.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
      ],
    );
  }
}
