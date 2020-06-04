import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/app_bar.dart';
import '../widgets/add_form.dart';

import 'doctors_screen.dart';

import 'package:devida/blocs/models/doctor.dart';


import 'package:devida/blocs/providers/doctor_provider.dart';


import 'package:provider/provider.dart';


class AddPerson extends StatefulWidget {
  static const routName = '/add-person';
  @override
  _AddPersonState createState() => _AddPersonState();
}
String identification_number = '';
Doctor data =  Doctor();
class _AddPersonState extends State<AddPerson> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final doctorID = args.doctor_id as int;
    @override
    void initState() async{
      if(args.isDrawer)
      print('true');
      // TODO: implement initState
      super.initState();
      if(doctorID != null){
        await Provider.of<DoctorProvider>(context, listen: false).fetchAndSetDoctor(doctorID);
      }
    }
    if(doctorID != null){
       data = Provider.of<DoctorProvider>(context, listen: false).doctor;

    }
    void submit()async{
      submitUtils.doctorSubmit(isDrawer: args.isDrawer,doctorID: doctorID ,data: data ,formKey: _formKey);
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Add Doctor',
            isForm: true,
            onSave: submit,
            onBack: (){
              print('ahmed');
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: DoctorsScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body:
      AddForm(data: data, personID: doctorID, formKey: _formKey,isDoctor: true,returniIdentification_number: (value){
        identification_number = value ;
      },),
    );
  }
}
