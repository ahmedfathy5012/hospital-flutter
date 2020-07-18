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

import '../blocs/models/doctor.dart';

class SubmitUtils {
  BuildContext context;
  SubmitUtils(this.context);

  Future<void> doctorSubmit(
      {GlobalKey<FormState> formKey,
        int doctorID = null,
        Doctor data,
        bool isDrawer=false
      }) async {
    print('tested data is ${data.blood_id}');
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      if (doctorID == null) {

//            print('first name ${data.first_name}');
//            print('second_name name ${data.second_name}');
//            print('third_name name ${data.third_name}');
//            print('email name ${data.email}');
//            print('phone name ${data.phone}');
//            print('identification_number name ${data.identification_number}');
//            print('address name ${data.address}');
//            print('job_id name ${data.job_id}');
//            print('specialization_id name ${data.specialization_id}');
//            print('gender_id name ${data.gender_id}');
//            print('blood_id name ${data.blood_id}');
//            print('user_role_id name ${data.user_role_id}');
//            print('first date_of_birth ${data.date_of_birth}');
//            print('first nationality_id ${data.nationality_id}');
//            print('status name ${data.social_status}');



        try {
          var respCode =
          await Provider.of<DoctorProvider>(context, listen: false)
              .addDoctor(doctorID, data);
          if (respCode.statusCode == 201) {
            print('sissssss');
            //Scaffold.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(content: Text('Ok')));
            if(isDrawer){
              //screenHelper.navigateReplacementNamed(routName: DoctorsScreen.routName,arguments: null);
              await Navigator.of(context).pushReplacementNamed(
                  DoctorsScreen.routName,
                 );
            }
            else {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
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
            if(isDrawer){
              await Navigator.of(context).pushReplacementNamed(
                EmployeesScreen.routName,
              );
//              screenHelper.navigateReplacementNamed(routName: EmployeesScreen.routName);
            }

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
            if(isDrawer){
              await Navigator.of(context).pushReplacementNamed(
                NursesScreen.routName,
              );
//              screenHelper.navigateReplacementNamed(routName: NursesScreen.routName);
            }

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
            if(isDrawer){
              await Navigator.of(context).pushReplacementNamed(
                NursesScreen.routName,
              );
//              screenHelper.navigateReplacementNamed(routName: PatientsScreen.routName);
            }

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
    ScreenHelper screenHelper = ScreenHelper(context);
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      screenHelper.showProgressDialog();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .login(authData.userName, authData.password);
      if (response == 0) {
        try{
          userData = Provider.of<AuthProvider>(context, listen: false).user;
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
            if(isDrawer){
              await Navigator.of(context).pushReplacementNamed(
                DiagnosesScreen.routName,
              );
              //screenHelper.navigateReplacementNamed(routName: DiagnosesScreen.routName);
            }

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
            if(isDrawer){
              await Navigator.of(context).pushReplacementNamed(
                PatientsScreen.routName,
              );
//              screenHelper.navigateReplacementNamed(routName: PatientsScreen.routName);
            }

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



