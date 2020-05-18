import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'dart:convert';

import 'screen_helper.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/doctors_screen.dart';
import '../ui/screens/patients_screen.dart';
import '../ui/screens/diagnoses_screen.dart';
import '../ui/screens/nurses_screen.dart';
import '../ui/screens/employees_screen.dart';
import '../ui/screens/surgeries_screen.dart';


import '../blocs/providers/doctor_provider.dart';
import '../blocs/providers/employee_provider.dart';
import '../blocs/providers/patient_provider.dart';
import '../blocs/providers/nurse_peovider.dart';
import '../blocs/providers/Diagnose_provider.dart';
import '../blocs/providers/surgery_provider.dart';

import '../blocs/providers/auth_provider.dart';

import '../blocs/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SubmitUtils {
  BuildContext context;
  SubmitUtils(this.context);

  Future<void> doctorSubmit(
      {GlobalKey<FormState> formKey,
        int doctorID = null,
        var data,
        bool isDrawer=false
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (doctorID == null) {
        try {
          var respCode =
          await Provider.of<DoctorProvider>(context, listen: false)
              .addDoctor(doctorID, data);
          if (respCode.statusCode == 201) {
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: DoctorsScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            if (json
                .decode(respCode.body)['message']
                .toString()
                .contains('users_identification_number_unique')) {
              screenHelper
                  .showAlertDialog('Identification Number Already Exist');
            }
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {
          await Provider.of<DoctorProvider>(context, listen: false)
              .updateDoctor(doctorID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }




  Future<void> employeeSubmit(
      {GlobalKey<FormState> formKey,
        int employeeID = null,
        var data,
        String identification_number,
        bool isDrawer=false,
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (employeeID == null) {
        try {
          var respCode =
          await Provider.of<EmployeeProvider>(context, listen: false)
              .addEmployee(employeeID, data);
          if (respCode.statusCode == 201) {
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: EmployeesScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            if (json
                .decode(respCode.body)['message']
                .toString()
                .contains('users_identification_number_unique')) {
              screenHelper
                  .showAlertDialog('Identification Number Already Exist');
            }
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {
          await Provider.of<EmployeeProvider>(context, listen: false)
              .updateEmployee(employeeID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future<void> nurseSubmit(
      {GlobalKey<FormState> formKey,
        int nurseID = null,
        var data,
        String identification_number,
        bool isDrawer=false
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (nurseID == null) {
        try {
          var respCode =
          await Provider.of<NurseProvider>(context, listen: false)
              .addNurse(nurseID, data, identification_number);
          if (respCode.statusCode == 201) {
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: NursesScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            if (json
                .decode(respCode.body)['message']
                .toString()
                .contains('users_identification_number_unique')) {
              screenHelper
                  .showAlertDialog('Identification Number Already Exist');
            }
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {
          await Provider.of<NurseProvider>(context, listen: false)
              .updateNurse(nurseID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }


  Future<void> patientSubmit(
      {GlobalKey<FormState> formKey,
        int patientID = null,
        var data,
        String identification_number,
        bool isDrawer=false,
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (patientID == null) {
        try {
          var respCode =
          await Provider.of<PatientProvider>(context, listen: false)
              .addPatient(patientID, data, identification_number);
          if (respCode.statusCode == 201) {
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: PatientsScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            if (json
                .decode(respCode.body)['message']
                .toString()
                .contains('users_identification_number_unique')) {
              screenHelper
                  .showAlertDialog('Identification Number Already Exist');
            }
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {

          await Provider.of<PatientProvider>(context, listen: false)
              .updatePatient(patientID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future<User> loginSubmit({GlobalKey<FormState> formKey, var authData}) async {
    User userData;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .login(authData.userName, authData.password);
      if (response == 0) {
        try{

          userData = Provider.of<AuthProvider>(context, listen: false).user;

          await prefs.setString('api_token', userData.api_token.toString());
          await prefs.setString('user_name', userData.user_name.toString());
          await prefs.setString('user_job', userData.user_job.toString());

          print('user_name ${prefs.getString('user_job')}');
        }catch(e){
          print(e);
         };
        Navigator.of(context).pushReplacementNamed(
          HomeScreen.routName,
        );
      } else if (response == 1) {
        screenHelper.showAlertDialog('The number or password is incorrect');
      } else if (response == 2) {
        screenHelper.showAlertDialog('Please Try Again');
      }
    }
  }


  Future<void> diagnoseSubmit(
      {GlobalKey<FormState> formKey,
        int diagnoseID = null,
        var data,
        bool isAddCase=false,
        bool isDrawer=false,
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (diagnoseID == null) {
        try {
          var respCode =
          await Provider.of<DiagnoseProvider>(context, listen: false)
              .addDiagnose(id: diagnoseID , diagnose: data , isAddCase: isAddCase);
          if (respCode.statusCode == 201) {
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: DiagnosesScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {
          await Provider.of<DiagnoseProvider>(context, listen: false)
              .updateDiagnose(diagnoseID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }


  Future<void> surgerySubmit(
      {GlobalKey<FormState> formKey,
        int surgeryID = null,
        var data,
        bool isDrawer=false,
      }) async {
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (surgeryID == null) {
        try {
          var respCode =
          await Provider.of<SurgeryProvider>(context, listen: false)
              .addSurgery(surgeryID, data);
          if (respCode.statusCode == 201) {
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer)
              screenHelper.navigateReplacementNamed(routName: PatientsScreen.routName);
            else
              Navigator.of(context).pop();
              Navigator.of(context).pop();
          } else {
            screenHelper.showAlertDialog('Error Try Again');
          }
        } catch (e) {
          print(e);
        }
      } else {
        try {
          await Provider.of<SurgeryProvider>(context, listen: false)
              .updateSurgery(surgeryID, data)
              .then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        } catch (e) {
          print(e);
        }
      }
    }
  }

}



