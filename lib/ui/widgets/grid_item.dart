import 'package:flutter/material.dart';
import 'package:devida/helpers/screen_helper.dart';

class GridItem extends StatelessWidget {
  final int count;
  final String title;
  final VoidCallback onTap;

  const GridItem({@required this.count,@required this.title,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21.0),
        ),
        //borderRadius: BorderRadius.circular(21.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenSize.screenHight(17.0),),
            Text('$count',style: TextStyle(fontSize: screenSize.screenWidth(42.0),color: Color(0xff5CA7E0),fontFamily: 'bahnschrirt' , fontWeight: FontWeight.w900),),
            SizedBox(height: screenSize.screenHight(5.0),),
            Text(title,style: TextStyle(fontSize: screenSize.screenWidth(20.0),color: Color(0xff1749A2),fontFamily: 'bahnschrirt' , fontWeight: FontWeight.w900),),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

