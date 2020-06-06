import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class DataList extends StatelessWidget {
  const DataList({
    @required this.data,
    this.isExtension=false,
    this.onTap, this.isDoctor=false, this.isPatient=false, this.isEmployee=false, this.isNurse=false,
  });

  final List data;
  final Function onTap;
  final bool isDoctor;
  final bool isPatient;
  final bool isEmployee;
  final bool isNurse;
  final bool isExtension;

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
          title: isExtension ? data[index].patient_name:data[index].showName,
          subTitle: returnSubTitle(index),
          image: data[index].gender.toString() == 'Male' ? 'assets/images/4.png' : 'assets/images/3.png',
          //image: data[index].image,
          doctorId: data[index].id,
        ),
      ),
    );
  }

  String returnSubTitle(int index){
    if(isDoctor){
     return data[index].specialization.title;
    }else if(isPatient){
      return data[index].date_of_file;
    }else if(isExtension){
      return data[index].doctor_name;
    }else{
      return data[index].job.title;
    }
  }
}
