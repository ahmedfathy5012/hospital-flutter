import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';


class DrawAppBar extends StatelessWidget {
  DrawAppBar({
    this.title=' ',
    this.isAdd = false,
    this.isForm = false,
    this.onBack = null,
    this.onAdd = null,
    this.onDelete = null,
    this.onEdit = null,
    this.onSave = null,
    this.isBack = false,
    this.isHome = false,
  });

  final bool isAdd;
  final bool isForm;
  final String title;
  final bool isBack;
  final VoidCallback onBack;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onSave;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff5CA7E0),
        ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: isHome ,
      title: isHome?
      Image.asset(
        'assets/logo/LOGO-BAR.png',
        scale: 2,
      )
      :
      Text(
        title,
        style: TextStyle(
            color: Color(0xff5CA7E0),
            fontSize:screenSize.screenWidth(35.0),
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.w500),
      ),
      leading: isBack ?
      IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff5CA7E0)),
          onPressed: onBack)
            :Padding(
        padding: EdgeInsets.only(left: screenSize.screenWidth(10)),
        child: GestureDetector(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset('assets/icons/11.png',scale: 4,),
        ),
      ),
      actions: isHome?
      null:
      isAdd
          ? <Widget>[
        Padding(
          padding: EdgeInsets.only(right: screenSize.screenWidth(10)),
          child: GestureDetector(
            onTap: onAdd,
            child: ImageIcon(
              AssetImage('assets/icons/6.png'),
            ),
          ),
        ),
      ]
      :
      isForm ?
      <Widget>[
        
        Padding(
          padding: EdgeInsets.only(right: screenSize.screenWidth(10)),
          child: GestureDetector(
            onTap: onSave,
            child: ImageIcon(
              AssetImage('assets/icons/26.png'),
            ),
          ),
        )
      ]
          :
      <Widget>[
        Padding(
          padding: EdgeInsets.only(right: screenSize.screenWidth(10)),
          child: GestureDetector(
            onTap: onEdit,
            child: ImageIcon(
              AssetImage('assets/icons/4.png'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: screenSize.screenWidth(10)),
          child: GestureDetector(
            onTap: onDelete,
            child: ImageIcon(
              AssetImage('assets/icons/39.png'),
            ),
          ),
        )
      ]

    );
  }
}
