import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    this.isRight = true,
    this.isAddress = false,
  });

  final String  title;
  final String subtitle;
  final String icon;
  final bool isRight;
  final bool isAddress;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Container(
      width: isAddress ? screenSize.screenWidth(300.0) : isRight?screenSize.screenWidth(135.0): screenSize.screenWidth(175.0),

      //isRight?screenSize.screenWidth(135.0): screenSize.screenWidth(175.0),
      height: screenSize.screenHight(26.0),
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: screenSize.screenWidth(12.5),
            backgroundImage: AssetImage(icon),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: screenSize.screenWidth(5.0),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
              SizedBox(height: screenSize.screenHight(3.0),),
              Text(subtitle,style: TextStyle(fontSize: 7.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
            ],
          )
        ],
      ),
    );
  }
}