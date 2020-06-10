import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/text_field_block.dart';
import '../widgets/choose_block.dart';

import 'diagnoses_screen.dart';

import 'package:devida/blocs/models/diagnose.dart';
import 'package:devida/blocs/providers/Diagnose_provider.dart';

import 'package:provider/provider.dart';



class DiagnoseFormScreen extends StatefulWidget {
  static const routName = '/add-diagnose';
  @override
  _DiagnoseFormScreenState createState() => _DiagnoseFormScreenState();
}
Diagnose data =  Diagnose();
class _DiagnoseFormScreenState extends State<DiagnoseFormScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);
    final ScreenArguments args = ModalRoute.of(context).settings.arguments ;
    final diagnoseID = args.diagnose_id as int ;
    final caseID = args.patient_case_id as int;
    final patientID = args.patient_id as int;
    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(diagnoseID != null){
        await Provider.of<DiagnoseProvider>(context, listen: false).fetchAndSetDiagnose(diagnoseID);
      }
    }
    if(diagnoseID != null){
      data = Provider.of<DiagnoseProvider>(context, listen: false).diagnose;
    }
    void submit()async{
      if(caseID != null){
        data.patient_case_id=caseID;
      }
      if(patientID != null){
        data.patient_id=patientID;
      }
      submitUtils.diagnoseSubmit(isDrawer: args.isDrawer,diagnoseID:diagnoseID ,data: data ,formKey: _formKey ,isAddCase: patientID == null ? true : caseID == null? true:false );
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Add Diagnose',
            isForm: true,
            onSave: submit,
            onBack: () {
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: DiagnosesScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body: Center(
          child: Container(
              width: screenHelper.screenWidth(310),
              height: screenHelper.screenHight(560),
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Form(
                  key: this._formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: screenHelper.screenHight(15.0),
                      ),
                      patientID != null || caseID != null ?
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ):
                      ChooseBlook(
                        isSearch: true,
                        isPatient: true,
                        dialogTitle: 'Choose Patient',
                        title: 'Patient',
                        initialValue: diagnoseID==null?null:data.doctor_name,
                        onSaved: (value) {
                          data.patient_id = value;
                        },
                      ),
                      patientID != null || caseID != null ?
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ):
                      SizedBox(
                        height: screenHelper.screenHight(10.0),
                      ),
                      ChooseBlook(
                        isSearch: true,
                        dialogTitle: 'Choose Doctor',
                        title: 'Doctor',
                        initialValue: diagnoseID==null?null:data.doctor_name,
                        onSaved: (value) {
                          data.doctor_id = value;
                        },
                      ),
                      SizedBox(
                        height: screenHelper.screenHight(10.0),
                      ),
                      TextFieldBlock(
                        maxLines: 5,
                        hintText: 'Diagnose',
                        height: 137.0,
                        initValue: diagnoseID==null?null:data.diagnose,
                        onSaved: (value) {
                          data.diagnose = value.toString();
                        },
                      ),
                      SizedBox(
                        height: screenHelper.screenHight(10.0),
                      ),
                      TextFieldBlock(
                        maxLines: 5,
                        hintText: 'Drugs',
                        height: 137.0,
                        initValue: diagnoseID==null?null:data.drugs,
                        onSaved: (value) {
                          data.drugs = value.toString();
                        },
                      ),
                      caseID == null ?
                      SizedBox(
                        height: screenHelper.screenHight(10.0),
                      ):
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ),
                      caseID != null ?
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ):
                      ChooseBlook(
                        isDate: true,
                        dialogTitle: 'Choose Entry Date',
                        title: 'Entry Date',
                        initialValue: diagnoseID==null?null:data.date_of_entry,
                        onSaved: (value) {
                          data.date_of_entry = value;
                        },
                      ),
                      caseID != null ?
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ):
                      SizedBox(
                        height: screenHelper.screenHight(10.0),
                      ),
                      caseID != null ?
                      SizedBox(
                        height: screenHelper.screenHight(0.0),
                      ):
                      ChooseBlook(
                        isDate: true,
                        dialogTitle: 'Choose Exit Date',
                        title: 'Exit Date',
                        initialValue: diagnoseID==null?null:data.date_of_exit,
                        onSaved: (value) {
                          data.date_of_exit = value;
                        },
                      ),

                    ],
                  ),
                ),
              ),
          ),
        ),

    );
  }
}
