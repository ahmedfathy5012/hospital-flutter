import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';



class SearchBar extends StatefulWidget {
  Function onChanged;
  SearchBar({this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  ScreenHelper screenSize;
  TextEditingController controller = TextEditingController();
  double width = 45.0;
  bool isExpand=false;
  @override
  Widget build(BuildContext context) {
    screenSize= ScreenHelper(context);
    return Container(
      height: screenSize.screenHight(40.0),
      width: screenSize.screenWidth(320.0), // 319.0
      color: Colors.transparent,
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: screenSize.screenHight(40.0),
            width: screenSize.screenWidth(width), // 319.0
            decoration: BoxDecoration(
              color: Color(0xffE5E5E5),
              borderRadius: BorderRadius.all(
                Radius.circular(screenSize.screenWidth(20.0)),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.only(right: 10.0),
              child: Row(
               mainAxisAlignment:isExpand?
               MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                children: <Widget>[
                   isExpand ?
                   Container(
                     height: screenSize.screenHight(38.0),
                     width: screenSize.screenWidth(170.0),
                     color: Colors.transparent,
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
                   ):SizedBox(width: 0.0,),
                     GestureDetector(
                      onTap: (){
                        setState(() {
                          if(!isExpand){
                            width = 319.0;
                            isExpand = true;
                          }else{
                            width = 30.0;
                            isExpand = false;
                          }
                        });
                      },
                      child: ImageIcon(
                        AssetImage('assets/icons/7.png'),
                        color: Color(0XFFA2A2A2),
                        size: screenSize.screenWidth(20.0),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}