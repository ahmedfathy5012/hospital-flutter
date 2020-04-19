import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class DataList extends StatelessWidget {
  const DataList({
    @required this.data,
    this.onTap, this.isDoctor=false, this.isPatient=false,
  });

  final List data;
  final Function onTap;
  final bool isDoctor;
  final bool isPatient;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Container(
      width: screenSize.screenWidth(323.0),
      height: screenSize.screenHight(499.0),
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index)=>ListItem(
          onTap: onTap,
          title: data[index].showName,
          subTitle: returnSubTitle(index),
          image: 'assets/images/3.png',
          //image: data[index].image,
          doctorId: data[index].id,
        ),
      ),
    );
  }

  String returnSubTitle(int index){
    if(isDoctor){
     return data[index].specialization.specialization_name;
    }else if(isPatient){
      return data[index].date_of_file;
    }else{
      null;
    }
  }
}
