import 'package:flutter/material.dart';
import 'package:devida/helpers/screen_helper.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0XFF1749A2),
      child: Center(
        child: Container(
         width: screenSize.screenWidth(297.0),
         height: screenSize.screenHight(135.0),
         color: Colors.transparent,
         child: Image.asset('assets/logo/LOGO.png',color: Colors.white,fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
