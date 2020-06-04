import 'package:flutter/material.dart';
import '../ui/screens/login_screen.dart';
import 'pref_services.dart';
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

  void showAlertDialog(String content){
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
                  //Navigator.of(context).pop();
                },
              ),
            ],
          );
      },
    );
  }


  void showProgressDialog(){
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return
          AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(
              child: Container(
                height: 40.0,
                width: 40.0,
                color: Colors.transparent,
                child: CircularProgressIndicator(),
              ),
            )
          );
      },
    );
  }


  void navigateReplacementNamed({String routName ,var arguments=null}) {
    Navigator.of(context).pushReplacementNamed(
        routName,
        arguments: arguments);
  }

  void navigateNamed({String routName ,var arguments=null}) {
    Navigator.of(context).pushNamed(
        routName,
        arguments: arguments);
  }

}