import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field_block.dart';
import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/blocs/models/doctor.dart';
import 'package:devida/blocs/models/user.dart';
import 'package:devida/blocs/providers/auth_provider.dart';

import 'home_screen.dart';

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
  ScreenHelper screenSize ;
  final _formKey = GlobalKey<FormState>();
  User user = User();
  AuthData _authData = AuthData();

  @override
  Widget build(BuildContext context) {

   screenSize = ScreenHelper(context);


    void submit() async {
      if (this._formKey.currentState.validate()) {
        _formKey.currentState.save(); // Save our form now.
        final response = await Provider.of<AuthProvider>(context, listen: false).login(_authData.userName,_authData.password);
        if(response==0){
          user = Provider.of<AuthProvider>(context, listen: false).user;
          Navigator.of(context).pushReplacementNamed(
              HomeScreen.routName,);
        }else if(response==1){
          _showDialog('The number or password is incorrect');
        }else if(response==2){
          _showDialog('Please Try Again');
        }
      }
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
                  height: screenSize.screenHight(130.0),
                ),
                Container(
                  width: screenSize.screenWidth(263.0),
                  height: screenSize.screenHight(104.0),
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/logo/LOGO.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: screenSize.screenHight(82.0),
                ),
                TextFieldBlock(
                  hintText: 'Identification Number',
                  height: 48.0,
                  returnValue: 'Please Enter Identification Number',
                  onSaved: (value) {
                    _authData.userName = value.toString();
                  },
                ),
                SizedBox(
                  height: screenSize.screenHight(20.0),
                ),
                TextFieldBlock(
                  hintText: 'Password',
                  height: 48.0,
                  returnValue: 'Please Enter Teh Password',
                  onSaved: (value) {
                    _authData.password = value.toString();
                  },
                ),
                SizedBox(
                  height: screenSize.screenHight(60.0),
                ),
                GestureDetector(
                  child: Container(
                    width: screenSize.screenWidth(130.0),
                    height: screenSize.screenHight(44.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF5CA7E0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(23.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 33),
                      ),
                    ),
                  ),
                  onTap: () {
                    submit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String content){
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return
          AlertDialog(
            title: Text('Error',style: TextStyle(fontSize: 25.0,color: Color(0XFF1749A2)),),
            content: Text(content.toString(),style: TextStyle(fontSize: 15.0,color: Color(0XFF5CA7E0)),),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel',style: TextStyle(fontSize: 11.0,color: Color(0XFF1749A2))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
      },
    );
  }
}
