import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field_block.dart';
import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/blocs/models/doctor.dart';
const int x=6;
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenSize.screenHight(130.0),),
                Container(
                  width: screenSize.screenWidth(263.0),
                  height: screenSize.screenHight(104.0),
                  color: Colors.transparent,
                  child: Image.asset('assets/logo/LOGO.png',fit: BoxFit.fill,),
                ),
                SizedBox(height: screenSize.screenHight(82.0),),
                TextFieldBlock(hintText: 'Identification Number', height: 48.0, returnValue:'Please Enter Identification Number',onSaved: (){},),
                SizedBox(height: screenSize.screenHight(20.0),),
                TextFieldBlock(hintText: 'Password', height: 48.0, returnValue:'Please Enter Teh Password',onSaved: (){},),
                SizedBox(height: screenSize.screenHight(60.0),),
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
                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 33),),
                    ),
                  ),
                  onTap: (){
                    if (_formKey.currentState.validate()) {
                       Provider.of<DoctorProvider>(context,listen: false).fetchAndSetDoctor(2);
//                      Scaffold
//                          .of(context)
//                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

