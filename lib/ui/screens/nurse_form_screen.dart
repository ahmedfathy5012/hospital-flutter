import 'package:flutter/material.dart';


import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/app_bar.dart';
import '../widgets/add_form.dart';

import 'nurses_screen.dart';

import 'package:devida/blocs/models/nurse.dart';


import 'package:devida/blocs/providers/nurse_peovider.dart';


import 'package:provider/provider.dart';


class NurseFormScreen extends StatefulWidget {
  static const routName = '/nurse-form';
  @override
  _NurseeFormScreenState createState() => _NurseeFormScreenState();
}
String identification_number = '';
Nurse data =  Nurse();
class _NurseeFormScreenState extends State<NurseFormScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments ;
    final nurseID = args.nurse_id as int;
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);

    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(nurseID != null){
        await Provider.of<NurseProvider>(context, listen: false).fetchAndSetNurse(nurseID);
      }
    }
    if(nurseID != null){
      data = Provider.of<NurseProvider>(context, listen: false).nurse;
    }
    void submit()async{
      submitUtils.nurseSubmit(isDrawer: args.isDrawer,nurseID: nurseID ,data: data ,formKey: _formKey ,identification_number:  identification_number);
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: nurseID == null ? 'Add Nurse' : 'Edit Nurse',
            isForm: true,
            onSave: submit,
            onBack: (){
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: NursesScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body:
      AddForm(data: data, personID: nurseID, formKey: _formKey,returniIdentification_number: (value){
        identification_number = value ;
      },),
    );
  }
}
