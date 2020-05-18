import 'package:flutter/material.dart';
import 'package:devida/helpers/screen_helper.dart';

class UsedButton extends StatelessWidget {
  UsedButton({
    this.title,
    this.onTap,
    this.width=130.0,
  });
  String title;
  dynamic width;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);

    return GestureDetector(
      child: Container(
        width: screenSize.screenWidth(width),
        height: screenSize.screenHight(44.0),
        decoration: BoxDecoration(
          color: Color(0XFF5CA7E0),
          borderRadius: BorderRadius.all(
            Radius.circular(23.0),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 33),
          ),
        ),
      ),
      onTap: onTap
    );
  }
}
