import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_item.dart';
import '../widgets/draw_drawer.dart';
import '../widgets/no_connection.dart';
import '../widgets/build_future.dart';
import '../widgets/app_bar.dart';

import 'package:devida/blocs/providers/count_provider.dart';
import 'package:devida/blocs/models/count.dart';

import 'doctors_screen.dart';
import 'patients_screen.dart';
import 'employees_screen.dart';
import 'nurses_screen.dart';
import 'diagnoses_screen.dart';
import 'surgeries_screen.dart';


import 'package:provider/provider.dart';





class HomeScreen extends StatelessWidget {
  static const routName = '/home';


  final List gridData= [
    {"title":"Doctor" ,"route":DoctorsScreen.routName,      "data":"doctor_count"},
    {"title":"Employee" ,"route":EmployeesScreen.routName,  "data":"doctor_count"},
    {"title":"Nurse" ,"route":NursesScreen.routName,        "data":"doctor_count"},
    {"title":"Patient" ,"route":PatientsScreen.routName,    "data":"doctor_count"},
    {"title":"Diagnose" ,"route":DiagnosesScreen.routName,  "data":"doctor_count"},
    {"title":"Surgery" ,"route":SurgeriesScreen.routName,   "data":"doctor_count"},
  ];
  @override
  Widget build(BuildContext context) {


    Future<bool> refreshCount() async {
      var retunData = await Provider.of<CountProvider>(context, listen: false).fetchCount();
      if(retunData== false || retunData== true)
        return retunData ;
      return false;
    }

    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            isHome: true,
          )
      ),
            body: BuildFuture (
              fetchData: refreshCount,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Consumer<CountProvider>(
                  builder: (context, countData, ch) => GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: screenSize.screenWidth(13),
                      mainAxisSpacing: screenSize.screenWidth(13),
                    ),
                    children: <Widget>[
                      GridItem(
                          count: countData.count.doctor_count,
                          title: 'Doctor',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                DoctorsScreen.routName,
                                arguments: null);
                          }),
                      GridItem(
                          count: countData.count.employee_count,
                          title: 'Employee',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                EmployeesScreen.routName,
                                arguments: null);
                          }),
                      GridItem(
                          count: countData.count.nurse_count,
                          title: 'Nurse',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                NursesScreen.routName,
                                arguments: null);
                          }),
                      GridItem(
                          count: countData.count.Patient_count,
                          title: 'Patient',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PatientsScreen.routName,
                                arguments: null);
                          }),
                      GridItem(
                          count: countData.count.diagnose_count,
                          title: 'Diagnose',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                DiagnosesScreen.routName,
                                arguments: null);
                          }),
                      GridItem(
                          count: countData.count.surgery_count,
                          title: 'Surgery',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SurgeriesScreen.routName,
                                arguments: null);
                          }),
                    ],
                  ),
                ),
              ),
            ),
      drawer:DrawDrawer(),
    );
  }
}



