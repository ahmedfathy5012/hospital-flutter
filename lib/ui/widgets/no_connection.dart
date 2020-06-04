import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.cast_connected,color:Color(0xffdedede),size: 250,),
          Text('No Connection',style: TextStyle(fontSize: 50.0,color: Color(0xffdedede),fontWeight: FontWeight.w500,fontFamily: 'bahnschrift'),),
        ],
      ),
    );
  }
}
