import 'package:flutter/material.dart';
import './ui/screens/splash_screen.dart';
import './ui/screens/login_screen.dart';
import './ui/screens/home_screen.dart';
import './ui/screens/doctor_screen.dart';
import './ui/screens/doctors_screen.dart';
import './ui/screens/add_person.dart';

import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/blocs/providers/doctors_provider.dart';
void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DoctorProvider()),
        ChangeNotifierProvider.value(value: DoctorsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DoctorsScreen(),
        routes: {
          DoctorScreen.routName : (context)=>DoctorScreen(),
          AddPerson.routName : (context)=>AddPerson(),
        },
      ),
    );
  }
}
