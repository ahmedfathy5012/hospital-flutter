import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';
import 'package:provider/provider.dart';


import 'add_person.dart';



import 'package:devida/blocs/providers/employees_provider.dart';

import 'employee_screen.dart';
import 'employee_form_screen.dart';

class EmployeesScreen extends StatelessWidget {
  static const routName = '/employees';
  int employeeID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    Future<void> _refreshEmployees() async {
      await Provider.of<EmployeesProvider>(context, listen: false)
          .fetchAndSetEmployees();
    }
    void filterSearchResults(text){
      Provider.of<EmployeesProvider>(context, listen: false)
          .setSearchText(text);
      _refreshEmployees();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
              isAdd: true,
              title: 'Employees',
              onBack: () {
                Navigator.of(context).pop();
              },
              onAdd: () {
                screenSize.navigateNamed(routName: EmployeeFormScreen.routName , arguments: ScreenArguments(
                  employee_id: null,
                ));
              })),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: screenSize.screenHight(13.0),
              ),
              SearchBar(
                onChanged: (text){
                  filterSearchResults(text);
                },
              ),
              SizedBox(
                height: screenSize.screenHight(20.0),
              ),
              FutureBuilder(
                future: _refreshEmployees(),
                builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : RefreshIndicator(
                  onRefresh: _refreshEmployees,
                  child: Consumer<EmployeesProvider>(
                    builder: (context, employeesData, _) => DataList(
                      isEmployee: true,
                      data: employeesData.doctors,
                      onTap: (value) {
                        employeeID = value;
                        print(employeeID);
                        Navigator.of(context).pushNamed(
                            EmployeeScreen.routName,
                            arguments: employeeID);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer:DrawDrawer(),
    );

  }
}
