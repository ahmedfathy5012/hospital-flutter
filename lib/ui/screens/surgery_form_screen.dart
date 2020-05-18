import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/text_field_block.dart';
import '../widgets/choose_block.dart';

import 'surgeries_screen.dart';

import 'package:devida/blocs/models/Surgery.dart';
import 'package:devida/blocs/providers/surgery_provider.dart';

import 'package:provider/provider.dart';



class SurgeryFormScreen extends StatefulWidget {
  static const routName = '/add-surgery';
  @override
  _SurgeryFormScreenState createState() => _SurgeryFormScreenState();
}
Surgery data =  Surgery();
class _SurgeryFormScreenState extends State<SurgeryFormScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);
    final ScreenArguments args = ModalRoute.of(context).settings.arguments ;
    final surgeryID = args.surgery_id as int ;
    final patient_id = args.patient_id as int;
    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(surgeryID != null){
        await Provider.of<SurgeryProvider>(context, listen: false).fetchAndSetSurgery(surgeryID);
      }
    }
    if(surgeryID != null){
      data = Provider.of<SurgeryProvider>(context, listen: false).surgery;
    }
    void submit()async{
      if(args.patient_id !=null){
        data.patient_id = patient_id;
        print('before');
      }
      submitUtils.surgerySubmit(isDrawer: args.isDrawer,surgeryID:surgeryID ,data: data ,formKey: _formKey);
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Add Surgery',
            isForm: true,
            onSave: submit,
            onBack: () {
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: SurgeriesScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenHelper.screenWidth(310),
            height: screenHelper.screenHight(560),
            color: Colors.transparent,
            child: Form(
              key: this._formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: screenHelper.screenHight(15.0),
                  ),
                  TextFieldBlock(
                    hintText: 'Surgery Name',
                    initValue: surgeryID==null?null:data.name_of_surgery,
                    onSaved: (value) {
                      data.name_of_surgery = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenHelper.screenHight(10.0),
                  ),
                  patient_id !=null ?
                  SizedBox(
                    height: screenHelper.screenHight(0.0),
                  ):
                  ChooseBlook(
                    isSearch: true,
                    isPatient: true,
                    dialogTitle: 'Choose Patient',
                    title: 'Patient',
                    initialValue: surgeryID==null?null:data.patient_name,
                    onSaved: (value) {
                      data.patient_id = value;
                    },
                  ),
                  patient_id !=null ?
                  SizedBox(
                    height: screenHelper.screenHight(0.0),
                  ):
                  SizedBox(
                    height: screenHelper.screenHight(10.0),
                  ),
                  ChooseBlook(
                    isSearch: true,
                    dialogTitle: 'Choose Surgeon',
                    title: 'Surgeon',
                    initialValue: surgeryID==null?null:data.surgeon_name,
                    onSaved: (value) {
                      data.surgeon_id = value;
                    },
                  ),
                  SizedBox(
                    height: screenHelper.screenHight(10.0),
                  ),
                  ChooseBlook(
                    isSearch: true,
                    dialogTitle: 'Choose Anesthesiologist',
                    title: 'Anesthesiologist',
                    initialValue: surgeryID==null?null:data.anesthesiologist_name,
                    onSaved: (value) {
                      data.anesthesiologist_id = value;
                    },
                  ),
                  SizedBox(
                    height: screenHelper.screenHight(10.0),
                  ),
                  ChooseBlook(
                    isSearch: true,
                    isAnesthetic: true,
                    dialogTitle: 'Choose anesthetic',
                    title: 'Anesthetic',
                    initialValue: surgeryID==null?null:data.anesthetic,
                    onSaved: (value) {
                      data.anesthetic_id = value;
                    },
                  ),
                  SizedBox(
                    height: screenHelper.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Date Of Surgery',
                    isDate: true,
                    title: 'Date Of Surgery',
                    initialValue:surgeryID==null?null: data.date_of_surgery.toString(),
                    onSaved: (value) {
                      data.date_of_surgery = value;
                    },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
