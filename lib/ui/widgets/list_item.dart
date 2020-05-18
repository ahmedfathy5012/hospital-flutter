import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {

  final Function onTap;
  final String title;
  final String subTitle;
  final String image;
  final int doctorId;

   const ListItem({this.onTap, this.title, this.subTitle, this.image , this.doctorId});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(doctorId);
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: CircleAvatar(
                radius: 29.0,
                backgroundImage: AssetImage(image),
              ),
              title: Text(title,style: TextStyle(fontSize: 25.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
              subtitle: Text(subTitle,style: TextStyle(fontSize: 18.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w500,fontFamily: 'bahnschrift'),),
            ),

          ],
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }
}
