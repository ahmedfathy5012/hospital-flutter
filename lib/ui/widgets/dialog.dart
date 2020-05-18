import 'package:flutter/material.dart';


class Dialog{
  void _showDialog(BuildContext context ,String content,){
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




