import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class DataList extends StatelessWidget {
  const DataList({
    @required this.data,
    this.onTap,
  });

  final List data;
  final Function onTap;
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
          subTitle:data[index].specialization.specialization_name,
          image: 'assets/images/3.png',
          //image: data[index].image,
          doctorId: data[index].id,
        ),
      ),
    );
  }
}
