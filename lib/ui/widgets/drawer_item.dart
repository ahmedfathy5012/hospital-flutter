import 'package:flutter/material.dart';
import 'package:devida/helpers/screen_helper.dart';
class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function onTap;

  const DrawerItem({this.title, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Column(
      children: <Widget>[
        ListTile(
          onTap: onTap,
          leading:Image.asset(icon,width: screenSize.screenWidth(30.0),),
          title:Text(title,style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
        ),
        SizedBox(height: screenSize.screenHight(5.0),),
        Divider(),
      ],
    );
  }
}
