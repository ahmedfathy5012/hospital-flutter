import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_upper.dart';
import '../widgets/info_basic.dart';
import '../widgets/info_container.dart';
import '../widgets/build_future.dart';


import 'employee_form_screen.dart';


import 'package:devida/blocs/providers/employee_provider.dart';
import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

class EmployeeScreen extends StatelessWidget {
  static const routName = '/employee';
  @override
  Widget build(BuildContext context) {
    final employeeID = ModalRoute.of(context).settings.arguments as int;


    Future<bool> _refreshDoctor(int employeeID) async {
     return await Provider.of<EmployeeProvider>(context, listen: false).fetchAndSetEmployee(employeeID);
    }

    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Employee',
            onDelete: () {},
            onEdit: () {
              screenSize.navigateNamed(routName: EmployeeFormScreen.routName , arguments: ScreenArguments(
                employee_id: employeeID,
              ));
            },
            onBack: (){
              Navigator.of(context).pop();
            },
          )),
      body: BuildFuture(
        id: employeeID,
        fetchData: _refreshDoctor,
        child: Consumer<EmployeeProvider>(
          builder: (context,employeeData,_)=>
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: screenSize.screenHight(8.0),
                    ),
                    InfoUpper(
                      title: employeeData.employee.full_name,
                      subtitle: employeeData.employee.job.job_name,
                      image: 'assets/images/3.png',
                    ),
                    SizedBox(
                      height: screenSize.screenHight(30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.screenWidth(25.0),
                      ),
                      child: Container(
                        width: screenSize.screenWidth(350.0),
                        height: screenSize.screenHight(299.0),
                        child: ListView(
                          children: <Widget>[
                            InfoBasic(data: employeeData.employee),
                            SizedBox(
                              height: screenSize.screenHight(15.0),
                            ),
                            InfoContainer(
                              icon: 'assets/icons/19.png',
                              subtitle: 'Notes',
                              isNote: true,
                              notes: employeeData.employee.notes,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      )
    );
  }
}
