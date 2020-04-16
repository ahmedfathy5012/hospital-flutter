import 'package:flutter/material.dart';
import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';

import 'package:devida/helpers/screen_helper.dart';

import '../widgets/app_bar.dart';
import '../widgets/text_field_block.dart';
import '../widgets/choose_block.dart';

import 'package:devida/blocs/models/specialization.dart';
import 'package:devida/blocs/models/nationality.dart';
import 'package:devida/blocs/models/job.dart';
import 'package:devida/blocs/models/blood.dart';
import 'package:devida/blocs/models/gender.dart';
import 'package:devida/blocs/models/doctor.dart';

import 'package:devida/blocs/providers/util_provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';


import 'package:provider/provider.dart';


class AddPerson extends StatefulWidget {
  static const routName = '/add-person';

  @override
  _AddPersonState createState() => _AddPersonState();

}


class selectionData{
  final int id;
  final String title;

  selectionData({this.id, this.title});

}

String identification_number = '';
int my;
Doctor data =  Doctor();


class _AddPersonState extends State<AddPerson> {

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



  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final doctorID = ModalRoute.of(context).settings.arguments as int;


    //var utilData = Provider.of<UtilProvider>(context, listen: false);
    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(doctorID == null){
      return null;
      }else{
        await Provider.of<DoctorProvider>(context, listen: false).fetchAndSetDoctor(doctorID);
      }
    }
    if(doctorID != null){
       data = Provider.of<DoctorProvider>(context, listen: false).doctor;
    }
    ScreenHelper screenSize = ScreenHelper(context);

    void submit()async{
      if (this._formKey.currentState.validate()) {
        _formKey.currentState.save(); // Save our form now.
        if(doctorID == null){
          try{
            await Provider.of<DoctorProvider>(context, listen: false).addDoctor(doctorID, data , identification_number).then((_){
              Navigator.of(context).pop();
            });
          }catch(e){
            print(e);
          }

        }else{
          try{
            await Provider.of<DoctorProvider>(context, listen: false).updateDoctor(doctorID, data).then((_){
              Navigator.of(context).pop();
            });
          }catch(e){
            print(e);
          }
        }
      }
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            title: 'Add Doctor',
            isForm: true,
            onSave: submit,
            onBack: (){
              Navigator.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              width: screenSize.screenWidth(310),
              height: screenSize.screenHight(560),
              color: Colors.transparent,
              child: Form(
                key: this._formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: screenSize.screenHight(15.0),
                    ),
                    TextFieldBlock(
                      hintText: 'First Name',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter First Name',
                      initValue: doctorID==null?null:data.first_name,
                      onSaved: (value) {
                        data.first_name = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Second Name',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Second Name',
                      initValue: doctorID==null?null:data.second_name,
                      onSaved: (value) {
                        data.second_name = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Third Name',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Third Name',
                      initValue: doctorID==null?null:data.third_name,
                      onSaved: (value) {
                        data.third_name = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Email Name',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Email',
                      initValue: doctorID==null?null:data.email,
                      onSaved: (value) {
                        data.email = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Phone Number',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Phone Number',
                      initValue: doctorID==null?null:data.phone,
                      onSaved: (value) {
                        data.phone = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Identification Number',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Identification Number',
                      initValue: doctorID==null?null:data.user.identidication_number,
                      onSaved: (value) {
                          identification_number=value.toString();
                      },
                      readOnly: doctorID==null?false:true,
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Address',
                      height: screenSize.screenHight(37.0),
                      returnValue: 'Please Enter Address',
                      initValue: doctorID==null?null:data.address,
                      onSaved: (value) {
                        data.address = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(
                      title: 'Social Status',
                      data: socialStatus,
                      initialValue: doctorID==null?null:data.social_status,
                      onSaved: (value) {
                        data.social_status = socialStatus[value-1].title;
                      },
                    ),

                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(
                      title: 'nationality',
                      data: nationalities,
                      initialValue: doctorID==null?null:data.nationality.nationality_name,
                      onSaved: (value) {
                        data.nationality_id = value;
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(title: 'Specialization',
                      data: specializations,
                      initialValue: doctorID==null?null:data.specialization.specialization_name,
                      onSaved: (value) {
          data.specialization_id = value;
          },),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(title: 'Job Title',
                      data: jobs,
                      initialValue: doctorID==null?null:data.job.job_name,
                      onSaved: (value) {
                        data.job_id = value;
                      },),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(title: 'Gender',
                      data: genders,
                      initialValue: doctorID==null?null:data.gender.gender_name,
                      onSaved: (value) {
                        data.gender_id = value;
                      },

                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(title: 'Blood',
                      data: blood,
                      initialValue:doctorID==null?null: data.blood.blood_name,
                      onSaved: (value) {
                        data.blood_id = value;
                      },),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    ChooseBlook(
                      isDate: true,
                      title: 'Date Of Hiring',
                      initialValue:doctorID==null?null: data.date_of_birth.toString(),
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
                      initValue: doctorID==null?null:data.notes,
                      onSaved: (value) {
                        data.notes = value.toString();
                      },
                    ),
                    SizedBox(
                      height: screenSize.screenHight(10.0),
                    ),
                    TextFieldBlock(
                      hintText: 'Image',
                      height: screenSize.screenHight(37.0),
                      returnValue: null,
                      initValue: doctorID==null?null:data.image,
                      onSaved: (value) {
                        data.image = value.toString();
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _showDataPicker() {
    final bool showTitleActions = true;
    DataPicker.showDatePicker(
      context,
      showTitleActions: showTitleActions,
      locale: 'zh',
      datas: ['dog', 'cat'],
      title: 'select',
      onChanged: (data) {
        print('onChanged date: $data');
      },
      onConfirm: (data) {
        print('onConfirm date: $data');
      },
    );
  }

}