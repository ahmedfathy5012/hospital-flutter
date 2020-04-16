import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';

import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';


class ChooseBlook extends StatefulWidget {

   ChooseBlook({
    @required this.title,
    this.isDate=false,
     this.dialogTitle,
     this.onSaved,
     this.initialValue,
     this.data
  }) ;
  final String title;
  final bool isDate;
  final String dialogTitle;
  final Function onSaved;
  final String initialValue;
  final List data;

  @override
  _ChooseBlookState createState() => _ChooseBlookState();
}

class _ChooseBlookState extends State<ChooseBlook> {
  String choosenTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    choosenTitle = widget.initialValue;
  }
  ScreenHelper screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = ScreenHelper(context);

    return Container(
      width: widget.isDate ? screenSize.screenWidth(100.0) : screenSize
          .screenWidth(290.0),
      height: screenSize.screenHight(37.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Color(0XFF1749A2),
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(23.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          widget.isDate? _selectDate():_showDialog();
        },
        child: Padding(
            padding:  EdgeInsets.only(left: 15.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width:  screenSize.screenWidth(200.0),
                  height: screenSize.screenHight(37.0),
                  child: choosenTitle == null ?
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.screenWidth(0.0)),
                    child: Text(widget.title,
                      style: TextStyle(
                          color: Color(0XFFA2A2A2),
                          fontSize: 20.0
                      ),
                    ),
                  )
                      :

                  Text(choosenTitle,
                    style: TextStyle(
                        color: Color(0XFF1749A2),
                        fontSize: 20.0
                    ),
                  ),

                ),
                Icon(Icons.keyboard_arrow_down, color: Color(0XFF1749A2),)
              ],
            )
        ),
      ),
    );
  }



  void _showDialog(){
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return
          AlertDialog(
            title: Text('Choose Nationality',style: TextStyle(fontSize: 25.0,color: Color(0XFF5CA7E0)),),
            content: SingleChildScrollView(
                child: Container(
                  width: screenSize.screenWidth(200.0),
                  height: screenSize.screenHight(150.0),
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context,index)=>Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                            onTap: (){
                              widget.onSaved(widget.data[index].id);
                              setState(() {
                                choosenTitle = widget.data[index].title;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text(widget.data[index].title,style: TextStyle(fontSize: 11.0,color: Color(0XFF1749A2)),)
                        ),
                        SizedBox(height: screenSize.screenHight(10.0),)
                      ],
                    ),
                  ),
                )
            ),
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


  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2024)
    );
    if(picked != null) setState((){

      setState(() {
        print(picked.toString());
        choosenTitle = "${picked.year}-${picked.month}-${picked.day}";
      });
      widget.onSaved(picked.toString());
    });
  }



//  void showDataPicker() {
//    final bool showTitleActions = true;
//    DataPicker.showDatePicker(
//      context,
//      showTitleActions: showTitleActions,
//      locale: 'zh',
//      selectedIndex: 0,
//      datas: [{1:'dog'}, {2:'cat'}],
//      title: 'select',
//      onChanged: (data) {
//        print('onChanged date: $data');
//      },
//      onConfirm: (data) {
//        print('onConfirm date: $data');
//      },
//    );
//}
}