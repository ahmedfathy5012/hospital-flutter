import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field_block.dart';
import '../widgets/used_button.dart';

import 'package:devida/blocs/models/user.dart';

const int x = 6;

class LoginScreen extends StatefulWidget {
  static const routName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class AuthData{
  @required  String userName;
  @required  String password;

  AuthData({this.userName, this.password});
}

class _LoginScreenState extends State<LoginScreen> {
  ScreenHelper screenHelper ;
  final _formKey = GlobalKey<FormState>();
  User user = User();
  AuthData authData = AuthData();

  @override
  Widget build(BuildContext context) {

   screenHelper = ScreenHelper(context);
   SubmitUtils submitUtils = SubmitUtils(context);

    void submit() async {
      submitUtils.loginSubmit(formKey: _formKey , authData: authData);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenHelper.screenHight(130.0),
                ),
                Container(
                  width: screenHelper.screenWidth(269.0),
                  height: screenHelper.screenHight(123.0),
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/logo/LOGO.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: screenHelper.screenHight(82.0),
                ),
                TextFieldBlock(
                  hintText: 'Identification Number',
                  height: 48.0,
                  returnValue: 'Please Enter Identification Number',
                  onSaved: (value) {
                    authData.userName = value.toString();
                  },
                ),
                SizedBox(
                  height: screenHelper.screenHight(20.0),
                ),
                TextFieldBlock(
                  isSecure: true,
                  hintText: 'Password',
                  height: 48.0,
                  returnValue: 'Please Enter Teh Password',
                  onSaved: (value) {
                    authData.password = value.toString();
                  },
                ),
                SizedBox(
                  height: screenHelper.screenHight(60.0),
                ),
                UsedButton(title: 'Login',onTap:submit ,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
