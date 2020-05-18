import 'package:flutter/material.dart';


import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/submit_utils.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/app_bar.dart';
import '../widgets/add_form.dart';

import 'employees_screen.dart';

import 'package:devida/blocs/models/employee.dart';


import 'package:devida/blocs/providers/employee_provider.dart';


import 'package:provider/provider.dart';


class EmployeeFormScreen extends StatefulWidget {
  static const routName = '/employee-form';
  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}
String identification_number = '';
Employee data =  Employee();
class _EmployeeFormScreenState extends State<EmployeeFormScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments ;
    final employeeID = args.employee_id as int;
    ScreenHelper screenHelper = ScreenHelper(context);
    SubmitUtils submitUtils = SubmitUtils(context);

    @override
    void initState() async{
      // TODO: implement initState
      super.initState();
      if(employeeID != null){
        await Provider.of<EmployeeProvider>(context, listen: false).fetchAndSetEmployee(employeeID);
      }
    }
    if(employeeID != null){
      data = Provider.of<EmployeeProvider>(context, listen: false).employee;
    }
    void submit()async{
      submitUtils.employeeSubmit(isDrawer: args.isDrawer,employeeID: employeeID ,data: data ,formKey: _formKey ,identification_number:  identification_number);
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHelper.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: employeeID == null ? 'Add Employee' : 'Edit Employee',
            isForm: true,
            onSave: submit,
            onBack: (){
              if(args.isDrawer)
                screenHelper.navigateReplacementNamed(routName: EmployeesScreen.routName);
              else
                Navigator.of(context).pop();
            },
          )),
      body:
      AddForm(data: data, personID: employeeID, formKey: _formKey,returniIdentification_number: (value){
        identification_number = value ;
      },),
    );
  }
}
