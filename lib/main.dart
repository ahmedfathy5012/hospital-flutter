import 'dart:async';

import 'package:flutter/material.dart';
import './ui/screens/splash_screen.dart';
import './ui/screens/login_screen.dart';
import './ui/screens/home_screen.dart';
import './ui/screens/doctor_screen.dart';
import './ui/screens/doctors_screen.dart';
import './ui/screens/add_person.dart';
import './ui/screens/patients_screen.dart';
import './ui/screens/patient_screen.dart';
import './ui/screens/employees_screen.dart';
import './ui/screens/nurses_screen.dart';
import './ui/screens/nurse_screen.dart';
import './ui/screens/employee_screen.dart';
import './ui/screens/employee_form_screen.dart';
import './ui/screens/nurse_form_screen.dart';
import './ui/screens/patient_form_screen.dart';
import './ui/screens/test.dart';
import './ui/screens/diagnose_screen.dart';
import './ui/screens/surgery_screen.dart';
import './ui/screens/patient_case_screen.dart';
import './ui/screens/diagnose_form_screen.dart';
import './ui/screens/surgery_form_screen.dart';
import './ui/screens/diagnoses_screen.dart';
import './ui/screens/surgeries_screen.dart';

import 'package:devida/blocs/models/blood.dart';

import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/blocs/providers/doctors_provider.dart';
import 'package:devida/blocs/providers/auth_provider.dart';
import 'package:devida/blocs/providers/count_provider.dart';
import 'package:devida/blocs/providers/patients_provider.dart';
import 'package:devida/blocs/providers/patient_provider.dart';
import 'package:devida/blocs/providers/employee_provider.dart';
import 'package:devida/blocs/providers/employees_provider.dart';
import 'package:devida/blocs/providers/nurse_peovider.dart';
import 'package:devida/blocs/providers/nurses_provider.dart';
import 'package:devida/blocs/providers/Diagnose_provider.dart';
import 'package:devida/blocs/providers/surgery_provider.dart';
import 'package:devida/blocs/providers/anesthetics_provider.dart';
import 'package:devida/blocs/providers/util_provider.dart';
import 'package:devida/blocs/providers/auth_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:devida/helpers/database_helper.dart';


void main(){
  //SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DoctorProvider()),
        ChangeNotifierProvider.value(value: DoctorsProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: CountProvider()),
        ChangeNotifierProvider.value(value: PatientsProvider()),
        ChangeNotifierProvider.value(value: PatientProvider()),
        ChangeNotifierProvider.value(value: EmployeesProvider()),
        ChangeNotifierProvider.value(value: EmployeeProvider()),
        ChangeNotifierProvider.value(value: NursesProvider()),
        ChangeNotifierProvider.value(value: NurseProvider()),
        ChangeNotifierProvider.value(value: DiagnoseProvider()),
        ChangeNotifierProvider.value(value: SurgeryProvider()),
        ChangeNotifierProvider.value(value: AnestheticsProvider()),
        ChangeNotifierProvider.value(value: UtilProvider()),
      ],
        child : MaterialApp(
            debugShowCheckedModeBanner: false,
            title : "devida",
            home: InitPage(),
            routes: {
              DoctorScreen.routName : (context)=>DoctorScreen(),
              AddPerson.routName : (context)=>AddPerson(),
              LoginScreen.routName : (context)=>LoginScreen(),
              HomeScreen.routName : (context)=>HomeScreen(),
              DoctorsScreen.routName : (context)=>DoctorsScreen(),
              PatientsScreen.routName : (context)=>PatientsScreen(),
              PatientScreen.routName : (context)=>PatientScreen(),
              EmployeesScreen.routName : (context)=>EmployeesScreen(),
              NursesScreen.routName : (context)=>NursesScreen(),
              EmployeeScreen.routName : (context)=>EmployeeScreen(),
              NurseScreen.routName : (context)=>NurseScreen(),
              EmployeeFormScreen.routName : (context)=>EmployeeFormScreen(),
              NurseFormScreen.routName : (context)=>NurseFormScreen(),
              PatientFormScreen.routName : (context)=>PatientFormScreen(),
              DiagnoseScreen.routName : (context)=>DiagnoseScreen(),
              SurgeryScreen.routName : (context)=>SurgeryScreen(),
              PatientCaseScreen.routName : (context)=>PatientCaseScreen(),
              DiagnoseFormScreen.routName : (context)=>DiagnoseFormScreen(),
              SurgeryFormScreen.routName : (context)=>SurgeryFormScreen(),
              DiagnosesScreen.routName : (context)=>DiagnosesScreen(),
              SurgeriesScreen.routName : (context)=>SurgeriesScreen(),
            },
             ),
    );
  }
}


class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context){
              return FutureBuilder(
                  future:  Provider.of<AuthProvider>(context,listen: false).currentUser(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.done){
                      if(snapshot.hasData){
                        print(snapshot.data);
                        return HomeScreen();
                      }else{
                        return LoginScreen();
                      }
                    }
                    return LoginScreen();
                  }
              );
            })));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();

  }
}


