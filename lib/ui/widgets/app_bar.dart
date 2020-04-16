import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';


class DrawAppBar extends StatelessWidget {
  DrawAppBar({
    @required this.title,
    this.isAdd = false,
    this.isForm = false,
    this.onBack = null,
    this.onAdd = null,
    this.onDelete = null,
    this.onEdit = null,
    this.onSave = null,
  });

  final bool isAdd;
  final bool isForm;
  final String title;
  final VoidCallback onBack;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        title,
        style: TextStyle(
            color: Color(0xff5CA7E0),
            fontSize:screenSize.screenWidth(35.0),
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.w500),
      ),
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff5CA7E0)),
          onPressed: onBack),
      actions: isAdd
          ? <Widget>[
        IconButton(
            icon: Icon(Icons.add, color: Color(0xff5CA7E0)),
            onPressed: onAdd)
      ]
      :
      isForm ?
      <Widget>[
        IconButton(
            icon: Icon(Icons.trending_up, color: Color(0xff5CA7E0)),
            onPressed: onSave),
      ]
          :
      <Widget>[
        IconButton(
            icon: Icon(Icons.edit, color: Color(0xff5CA7E0)),
            onPressed: onEdit),
        IconButton(
            icon: Icon(Icons.delete, color: Color(0xff5CA7E0)),
            onPressed: onDelete),
      ]

    );
  }
}