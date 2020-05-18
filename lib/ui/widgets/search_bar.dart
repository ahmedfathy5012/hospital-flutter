import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';



class SearchBar extends StatefulWidget {
  Function onChanged;
  SearchBar({this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Container(
      height: screenSize.screenHight(40.0),
      width: screenSize.screenWidth(319.0),
      decoration: BoxDecoration(
        color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.all(
          Radius.circular(17.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: screenSize.screenWidth(15.0)),
        child: Align(
          alignment: Alignment.centerLeft,
          child:
              TextFormField(
                onChanged: (text){
                  widget.onChanged(text);
                },
                controller: controller,
                  style: TextStyle(
                      color: Color(0XFF1749A2),
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Color(0XFFA2A2A2),
                          fontSize: 20.0
                      ),
                      //labelText: 'E-mail Address',
                      border: InputBorder.none
                  ),
              ),

        ),
      ),
    );
  }
}