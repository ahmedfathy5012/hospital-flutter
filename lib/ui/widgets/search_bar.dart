import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Container(
      height: screenSize.screenHight(33.0),
      width: screenSize.screenWidth(319.0),
      decoration: BoxDecoration(
        color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.all(
          Radius.circular(17.0),
        ),
      ),
    );
  }
}