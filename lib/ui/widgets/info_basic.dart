import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';

import 'info_row.dart';
import 'info_item.dart';

class InfoBasic extends StatelessWidget {
  const InfoBasic({
    Key key,
    @required this.data, this.isPatient=false,
  });
  final data;
  final bool isPatient;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        InfoRow(
            leftTitle: data.email,
            leftSubtitle: 'Email',
            leftIcon: 'assets/icons/12.png',
            rightTitle: data.phone,
            rightSubtitle: 'Phone',
            rightIcon: 'assets/icons/14.png'),
        SizedBox(height: screenSize.screenHight(15.0),),
        InfoRow(
            leftTitle: data.user.identidication_number,
            leftSubtitle: 'Identification Number',
            leftIcon: 'assets/icons/38.png',
            rightTitle: isPatient ? data.job:data.job.job_name,
            rightSubtitle: 'Job Title',
            rightIcon: 'assets/icons/16.png'),
        SizedBox(height: screenSize.screenHight(15.0),),
        InfoRow(
            leftTitle: data.date_of_birth.toString(),
            leftSubtitle: 'Date Of Birth',
            leftIcon: 'assets/icons/13.png',
            rightTitle: isPatient?data.date_of_file == null ? '':data.date_of_file.toString():data.date_of_hiring == null ? '':data.date_of_hiring.toString() ,
            rightSubtitle: isPatient? 'Date Of File':'Date Of Hiring',
            rightIcon: 'assets/icons/13.png'
        ),
        SizedBox(height: screenSize.screenHight(15.0),),
        InfoRow(
            leftTitle: data.gender.gender_name,
            leftSubtitle: 'Gender',
            leftIcon: 'assets/icons/17.png',
            rightTitle: data.blood.blood_name,
            rightSubtitle: 'Blood',
            rightIcon: 'assets/icons/18.png'),
        SizedBox(height: screenSize.screenHight(15.0),),
        InfoRow(
            leftTitle: data.nationality.nationality_name,
            leftSubtitle: 'Nationality',
            leftIcon: 'assets/icons/20.png',
            rightTitle: data.social_status,
            rightSubtitle: 'Social Status',
            rightIcon: 'assets/icons/22.png'),
        SizedBox(height: screenSize.screenHight(15.0),),
        Padding(
          padding:  EdgeInsets.only(left:screenSize.screenWidth(8.0)),
          child: InfoItem(title:data.address, subtitle: 'Address', icon:  'assets/icons/15.png',isAddress: true,),
        )
      ],
    );
  }
}

