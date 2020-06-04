import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'text_field_block.dart';
import 'choose_block.dart';

class selectionData{
  final int id;
  final String title;

  selectionData({this.id, this.title});

}

class AddForm extends StatelessWidget {
  var data;
  int personID;
  GlobalKey<FormState> formKey;
  Function returniIdentification_number;
  bool isDoctor;
  bool isPatient;

  AddForm({this.data , this.personID , this.formKey , this.returniIdentification_number , this.isDoctor=false , this.isPatient=false});
  List jobs = [
    selectionData(id:1,title:'Human Resource Director'),
    selectionData(id:2,title:'Municipal Clerk'),
    selectionData(id:3,title:'Auxiliary Equipment Operator'),
    selectionData(id:4,title:'Municipal Court Clerk'),
    selectionData(id:5,title:'Cardiovascular Technologist'),
    selectionData(id:6,title:'Counselor'),
    selectionData(id:7,title:'Textile Knitting Machine Operator'),
    selectionData(id:8,title:'Production Helper'),
    selectionData(id:9,title:'Computer Software Engineer'),
    selectionData(id:10,title:'Construction Laborer'),
    selectionData(id:11,title:'Fashion Model'),
  ];


  List socialStatus = [
    selectionData(id:1,title:'Married'),
    selectionData(id:2,title:'Celibate'),
  ];

  List patientJobs = [
    selectionData(id:1,title:'Married'),
    selectionData(id:2,title:'Celibate'),
    selectionData(id:3,title:'Married'),
    selectionData(id:4,title:'Celibate'),
    selectionData(id:5,title:'Married'),
    selectionData(id:6,title:'Celibate'),
    selectionData(id:7,title:'Married'),
    selectionData(id:8,title:'Celibate'),
    selectionData(id:9,title:'Married'),
    selectionData(id:10,title:'Celibate'),
    selectionData(id:11,title:'Married'),
    selectionData(id:12,title:'Celibate'),
  ];

  List genders = [
    selectionData(id:1,title:'Male'),
    selectionData(id:2,title:'Female'),
    selectionData(id:3,title:'other'),
  ];

  List blood = [
    selectionData(id:1,title:'O+'),
    selectionData(id:2,title:'A-'),
    selectionData(id:3,title:'B-'),
    selectionData(id:4,title:'A+'),
    selectionData(id:5,title:'O-'),
    selectionData(id:6,title:'B+'),
    selectionData(id:7,title:'AB-'),
    selectionData(id:8,title:'AB+'),
  ];


  List roles = [
    selectionData(id:1,title:'Admin'),
    selectionData(id:2,title:'ana'),
    selectionData(id:3,title:'Admin'),
    selectionData(id:4,title:'Admin'),
    selectionData(id:5,title:'Admin'),
  ];

  List nationalities = [
    selectionData(id:1,title:'Kyrgyz Republic'),
    selectionData(id:2,title:'Saint Vincent and the Grenadines'),
    selectionData(id:3,title:'Austria'),
    selectionData(id:4,title:'Belgium'),
    selectionData(id:5,title:'Turkmenistan'),
  ];


  List specializations = [
    selectionData(id:1,title:'voluptas'),
    selectionData(id:2,title:'in'),
    selectionData(id:3,title:'aut'),
    selectionData(id:4,title:'explicabo'),
    selectionData(id:5,title:'ratione'),
    selectionData(id:6,title:'debitis'),
    selectionData(id:7,title:'repudiandae'),
    selectionData(id:8,title:'rem'),
    selectionData(id:9,title:'dolor'),
    selectionData(id:10,title:'quidem'),
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
                    data: socialStatus,
                    initialValue: personID==null?null:data.social_status,
                    onSaved: (value) {
                      data.social_status = socialStatus[value-1].title;
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Nationality',
                    title: 'Nationality',
                    data: nationalities,
                    initialValue: personID==null?null:data.nationality.nationality_name,
                    onSaved: (value) {
                      data.nationality_id = value;
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
                    data: specializations,
                    initialValue: personID==null?null:data.specialization.specialization_name,
                    onSaved: (value) {
                      data.specialization_id = value;
                    },):SizedBox(height: 0.0,),

                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  isPatient?
                  ChooseBlook(
                    dialogTitle: 'Choose Job Title',
                    title: 'Job Title',
                    data: patientJobs,
                    initialValue: personID==null?null:data.job,
                    onSaved: (value) {
                      data.job = patientJobs[value-1].title;
                    },
                  )
                      :
                  ChooseBlook(
                    dialogTitle: 'Choose Job Title',
                    title: 'Job Title',
                    data: jobs,
                    initialValue: personID==null?null:data.job.job_name,
                    onSaved: (value) {
                      data.job_id = value;
                    },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Gender',
                    title: 'Gender',
                    data: genders,
                    initialValue: personID==null?null:data.gender.gender_name,
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
                    data: blood,
                    initialValue:personID==null?null: data.blood.blood_name,
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
                    height: screenSize.screenHight(37.0),
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
                    data: roles,
                    initialValue: personID==null?null:data.user.user_role.toString(),
                    onSaved: (value) {
                      data.user_role_id = value;
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
