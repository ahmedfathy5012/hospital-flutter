import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';
import 'info_item.dart';
import 'drawer_item.dart';

import '../screens/doctors_screen.dart';
import '../screens/patients_screen.dart';
import '../screens/employees_screen.dart';
import '../screens/nurses_screen.dart';
import '../screens/diagnoses_screen.dart';
import '../screens/surgeries_screen.dart';
import '../screens/home_screen.dart';

import '../screens/add_person.dart';
import '../screens/patient_form_screen.dart';
import '../screens/employee_form_screen.dart';
import '../screens/diagnose_form_screen.dart';
import '../screens/surgery_form_screen.dart';
import '../screens/nurse_form_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DrawDrawer extends StatefulWidget {
  @override
  _DrawDrawerState createState() => _DrawDrawerState();
}

class _DrawDrawerState extends State<DrawDrawer> {
  SharedPreferences prefs;
  String userJob;


  @override

 getPrefs( ) async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenSize.screenHight(150.0),
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/3.png'),
                    radius: screenSize.screenWidth(30.0),
                  ),
                  SizedBox(
                    height: screenSize.screenHight(5.0),
                  ),

                  Text(
                    'Ahmed Fathy',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xff1749A2),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bahnschrift'),
                  ),
                  SizedBox(
                    height: screenSize.screenHight(2.0),
                  ),
                  Text(
                    'ahmed',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffA2A2A2),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'bahnschrift'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenSize.screenHight(485.0),
            color: Colors.transparent,
            child: ListView(
              children: <Widget>[
                DrawerItem(
                  title: "Home",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: HomeScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Doctors",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: DoctorsScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Doctor",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: AddPerson.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
                DrawerItem(
                  title: "Patients",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(routName: PatientsScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Patient",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: PatientFormScreen.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
                DrawerItem(
                  title: "Employees",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: EmployeesScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Employee",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: EmployeeFormScreen.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
                DrawerItem(
                  title: "Nurses",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: NursesScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Nurse",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: NurseFormScreen.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
                DrawerItem(
                  title: "Diagnioses",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: DiagnosesScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Diagnose",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: DiagnoseFormScreen.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
                DrawerItem(
                  title: "Surgery",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: SurgeriesScreen.routName);
                  },
                ),
                DrawerItem(
                  title: "Add Surgery",
                  icon: "assets/icons/23.png",
                  onTap: () {
                    screenSize.navigateReplacementNamed(
                        routName: SurgeryFormScreen.routName,
                        arguments: ScreenArguments(
                          isDrawer: true,
                        ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
