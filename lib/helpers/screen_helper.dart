import 'package:flutter/material.dart';
class ScreenHelper{

  BuildContext context;
  ScreenHelper(this.context);

  double screenHight(double factor){
    return (factor/640)*MediaQuery.of(context).size.height;
  }

  double screenWidth(double factor){
    return (factor/360)*MediaQuery.of(context).size.width;
  }

  static const Color darkBlue = Color(0XFF1749A2);
  static const Color lightBlue = Color(0XFF5CA7E0);
}