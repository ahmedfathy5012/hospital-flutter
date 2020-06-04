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
import '../screens/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:devida/blocs/providers/auth_provider.dart';
import 'package:provider/provider.dart';



class DrawDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return FutureBuilder(
      future: Provider.of<AuthProvider>(context).loadPref(),
      builder: (context,snapshot)=>
          Drawer(
        child: Consumer<AuthProvider>(
            builder: (context,auth,_){
              return Column(
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
                            auth.user_name,
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
                            auth.user_job,
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
                          icon: "assets/icons/42.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: HomeScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Doctors",
                          icon: "assets/icons/29.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: DoctorsScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Doctor",
                          icon: "assets/icons/29.png",
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
                          icon: "assets/icons/33.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(routName: PatientsScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Patient",
                          icon: "assets/icons/33.png",
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
                          icon: "assets/icons/29.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: EmployeesScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Employee",
                          icon: "assets/icons/29.png",
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
                          icon: "assets/icons/29.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: NursesScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Nurse",
                          icon: "assets/icons/29.png",
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
                          icon: "assets/icons/24.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: DiagnosesScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Diagnose",
                          icon: "assets/icons/24.png",
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
                          icon: "assets/icons/27.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: SurgeriesScreen.routName);
                          },
                        ),
                        DrawerItem(
                          title: "Add Surgery",
                          icon: "assets/icons/27.png",
                          onTap: () {
                            screenSize.navigateReplacementNamed(
                                routName: SurgeryFormScreen.routName,
                                arguments: ScreenArguments(
                                  isDrawer: true,
                                ));
                          },
                        ),

                        DrawerItem(
                          title: "Log Out",
                          icon: "assets/icons/40.png",
                          onTap: () {

                            screenSize.navigateReplacementNamed(
                                routName: LoginScreen.routName);

                            Future.delayed(const Duration(milliseconds: 500), () {
                              auth.logout();
                            });
                          },
                        ),
                      ],
                    ),

                  )
                ],
              );}
        ),
      ),
    );
  }
}
