import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'text_field_block.dart';
import 'choose_block.dart';
import 'build_future.dart';
import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/util_provider.dart';
import 'package:devida/helpers/database_helper.dart';

class selectionData{
  final int id;
  final String title;

  selectionData({this.id, this.title});

}


class AddForm extends StatelessWidget {
  DatabaseHelper helper = DatabaseHelper();
  var data;
  int personID;
  GlobalKey<FormState> formKey;
  Function returniIdentification_number;
  bool isDoctor;
  bool isPatient;


  AddForm({this.data , this.personID , this.formKey , this.returniIdentification_number , this.isDoctor=false , this.isPatient=false});

  List SocialStatus = [
    selectionData(id:1,title:'Married'),
    selectionData(id:2,title:'Celibate'),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return SingleChildScrollView(
      child: Center(
        child: Container(
            width: screenSize.screenWidth(310),
            height: screenSize.screenHight(560),
            color: Colors.transparent,
            child: Form(
              key: this.formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.screenHight(15.0),
                  ),
                  TextFieldBlock(
                    hintText: 'First Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter First Name',
                    initValue: personID==null?null:data.first_name,
                    onSaved: (value) {
                      data.first_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Second Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Second Name',
                    initValue: personID==null?null:data.second_name,
                    onSaved: (value) {
                      data.second_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Third Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Third Name',
                    initValue: personID==null?null:data.third_name,
                    onSaved: (value) {
                      data.third_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Email Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Email',
                    initValue: personID==null?null:data.email,
                    onSaved: (value) {
                      data.email = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Phone Number',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Phone Number',
                    initValue: personID==null?null:data.phone,
                    onSaved: (value) {
                      data.phone = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Identification Number',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Identification Number',
                    initValue: personID==null?null:data.user.identidication_number,
                    onSaved: (value) {
                      data.identification_number = value.toString();
                      //returniIdentification_number(value.toString());
                    },
                    readOnly: personID==null?false:true,
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Address',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Address',
                    initValue: personID==null?null:data.address,
                    onSaved: (value) {
                      data.address = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Social Status',
                    title: 'Social Status',
                    utilName: 'social',
                    initialValue: personID==null?null:data.social_status,
                    onSaved: (value) {
                      data.social_status = SocialStatus[value-1].title;
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Nationality',
                    title: 'Nationality',
                    utilName: 'nationality',
                    helper: helper,
                    initialValue: personID==null?null:data.nationality.title,
                    onSaved: (value) {
                      data.id = value;
                    },
                  ),
                  isDoctor?
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  )
                      :
                  SizedBox(height: 0.0,)
                  ,
                  isDoctor ?
                  ChooseBlook(
                    dialogTitle: 'Choose Specialization',
                    title: 'Specialization',
                    utilName: 'specialization',
                    helper: helper,
                    initialValue: personID==null?null:data.specialization.title,
                    onSaved: (value) {
                      data.specialization_id = value;
                    },):SizedBox(height: 0.0,),

                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  isPatient?
                  TextFieldBlock(
                    hintText: 'Job',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Job title',
                    initValue: personID==null?null:data.job,
                    onSaved: (value) {
                      data.job = value.toString();
                    },
                  )
//                  ChooseBlook(
//                    dialogTitle: 'Choose Job Title',
//                    title: 'Job Title',
//                    data: patientJobs,
//                    initialValue: personID==null?null:data.job,
//                    onSaved: (value) {
//                      data.job = patientJobs[value-1].title;
//                    },
//                  )
                      :
                  ChooseBlook(
                    dialogTitle: 'Choose Job Title',
                    title: 'Job Title',
                    utilName: 'job',
                    helper: helper,
                    initialValue: personID==null?null:data.job.title,
                    onSaved: (value) {
                      data.job_id = value;
                    },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Gender',
                    title: 'Gender',
                    utilName: 'gender',
                    helper: helper,
                    initialValue: personID==null?null:data.gender.title,
                    onSaved: (value) {
                      data.gender_id = value;
                    },

                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),

                      ChooseBlook(
                        dialogTitle: 'Choose Blood',
                        title: 'Blood',
                        utilName: 'blood',
                        helper: helper,
                        initialValue:personID==null?null: data.blood.title,
                        onSaved: (value) {
                          data.blood_id = value;
                        },),



                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Date Of Birth',
                    isDate: true,
                    title: 'Date Of Birth',
                    initialValue:personID==null?null: data.date_of_birth.toString(),
                    onSaved: (value) {
                      data.date_of_birth = value;
                    },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(

                    hintText: 'Notes',
                    returnValue: null,
                    initValue: personID==null?null:data.notes,
                    onSaved: (value) {
                      data.notes = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),

                  ChooseBlook(
                    dialogTitle: 'Choose Role ',
                    title: 'Role',
                    utilName: 'role',
                    helper: helper,
                    initialValue: personID==null?null:data.user.user_role.toString(),
                    onSaved: (value) {
                      data.user.user_role_id = value;
                    },
                  )
//                  TextFieldBlock(
//                    hintText: 'Image',
//                    height: screenSize.screenHight(37.0),
//                    returnValue: null,
//                    initValue: personID==null?null:data.image,
//                    onSaved: (value) {
//                      data.image = value.toString();
//                    },
//                  ),
                ],
              ),
            )),
      ),
    );
  }
}
