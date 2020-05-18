import 'package:flutter/material.dart';


import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/app_bar.dart';

import '../widgets/add_form.dart';

import 'patients_screen.dart';


import 'package:devida/blocs/models/patient.dart';


import 'package:devida/blocs/providers/patient_provider.dart';


import 'package:provider/provider.dart';


class PatientFormScreen extends StatefulWidget {
  static const routName = '/patient-form';
  @override
  _PatientFormScreenState createState() => _PatientFormScreenState();
}
String identification_number = '';
Patient data =  Patient();
class _PatientFormScreenState extends State<PatientFormScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments ;
    final patientID =args.patient_id as int;
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);

    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(patientID != null){
        await Provider.of<PatientProvider>(context, listen: false).fetchAndSetPatient(patientID);
      }
    }
    if(patientID != null){
      data = Provider.of<PatientProvider>(context, listen: false).patient;
    }
    void submit()async{
      submitUtils.patientSubmit(patientID: patientID ,data: data ,formKey: _formKey ,identification_number:  identification_number);
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: patientID == null ? 'Add Patient' : 'Edit Patient',
            isForm: true,
            onSave: submit,
            onBack: (){
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: PatientsScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body:
      AddForm(data: data, personID: patientID, isPatient: true,formKey: _formKey,returniIdentification_number: (value){
        identification_number = value ;
      },),
    );
  }
}
