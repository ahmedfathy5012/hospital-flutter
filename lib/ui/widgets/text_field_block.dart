import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';

class TextFieldBlock extends StatelessWidget {

  const TextFieldBlock({
    @required this.hintText,
    @required this.height,
    @required this.returnValue,
    @required this.onSaved,
    this.initValue,
    this.readOnly=false

  });

  final String hintText;
  final String returnValue;
  final double height;
  final Function onSaved;
  final String initValue;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
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
              initialValue: initValue == '' ? null : initValue ,
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
