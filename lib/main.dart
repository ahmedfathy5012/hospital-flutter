import 'package:flutter/material.dart';
import './ui/screens/splash_screen.dart';
import './ui/screens/login_screen.dart';
import './ui/screens/home_screen.dart';
import './ui/screens/doctor_screen.dart';
import './ui/screens/doctors_screen.dart';
import './ui/screens/add_person.dart';
import './ui/screens/patients_screen.dart';
import './ui/screens/patient_screen.dart';




import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/blocs/providers/doctors_provider.dart';
import 'package:devida/blocs/providers/auth_provider.dart';
import 'package:devida/blocs/providers/count_provider.dart';
import 'package:devida/blocs/providers/patients_provider.dart';
import 'package:devida/blocs/providers/patient_provider.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          DoctorScreen.routName : (context)=>DoctorScreen(),
          AddPerson.routName : (context)=>AddPerson(),
          LoginScreen.routName : (context)=>LoginScreen(),
          HomeScreen.routName : (context)=>HomeScreen(),
          DoctorsScreen.routName : (context)=>DoctorsScreen(),
          PatientsScreen.routName : (context)=>PatientsScreen(),
          PatientScreen.routName : (context)=>PatientScreen(),
        },
      ),
    );
  }
}

