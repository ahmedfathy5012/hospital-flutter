import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';
ScreenHelper screenSize;
class TextFieldBlock extends StatelessWidget {

   TextFieldBlock({
    this.hintText,
    this.height=48.0,
    this.returnValue=null,
    this.onSaved,
    this.initValue,
    this.readOnly=false,
    this.maxLines = 1,
    this.isSecure=false,
    this.controller=null,
  });

   String hintText;
   String returnValue;
   double height;
   Function onSaved;
   String initValue;
   bool readOnly;
   int maxLines;
   bool isSecure;
   TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    screenSize = ScreenHelper(context);
    return Container(
      width: screenSize.screenWidth(290.0),
      height: screenSize.screenHight(height),
      child:  Container(
        width: screenSize.screenWidth(290.0),
      height: screenSize.screenHight(height),
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
        child: Padding(
          padding:  EdgeInsets.only(left: 15.0),
          child:
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly?true:false,
              style: TextStyle(
                  color: Color(0XFF1749A2),
                  fontSize: 20.0
              ),
              decoration: InputDecoration(

                hintText: hintText,
                hintStyle: TextStyle(
                    color: Color(0XFFA2A2A2),
                      fontSize: 20.0
                  ),
                  //labelText: 'E-mail Address',
                  border: InputBorder.none
                  
              ),
              obscureText: isSecure,
              //initialValue: initValue == '' ? null : initValue ,
              validator: (value){
                if(value.isEmpty){
                  return returnValue;
                }else{
                  return null;
                }
              },
              onSaved: (value){
                onSaved(value);
              }
          ),
        ),
      ),
    );

  }
}
