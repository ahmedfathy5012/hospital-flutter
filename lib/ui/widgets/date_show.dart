import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class DateShow extends StatelessWidget {
  DateShow({
    this.title,
    this.subtitle
  });

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff1749A2),
              fontWeight: FontWeight.w600,
              fontFamily: 'bahnschrift'),
        ),
        SizedBox(
          height: screenSize.screenHight(10.0),
        ),
        Container(
          height: screenSize.screenHight(40.0),
          width: screenSize.screenWidth(150.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Color(0XFF1749A2),
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(23.0),
            ),
          ),
          child: Center(
            child: Text(
              subtitle,
              style: TextStyle(
                  color: Color(0xff5CA7E0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'bahnschrift'),
            ),
          ),
        ),
      ],
    );
  }
}