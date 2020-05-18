import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';

import 'package:provider/provider.dart';

import 'add_person.dart';
import 'patient_screen.dart';
import 'patient_form_screen.dart';

import 'package:devida/blocs/models/patients.dart';
import 'package:devida/blocs/providers/patients_provider.dart';
import 'package:devida/helpers/screen_arguments.dart';

class PatientsScreen extends StatelessWidget {
  static const routName = '/Patients';
  String title = 'Patients';
  String subTitle = 'Patient';
  Function onBack;
  Function onAdd;
  int personID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    List<Patients> data =
        Provider.of<PatientsProvider>(context, listen: false).patients;
    Future<void> _refreshPatients() async {
      await Provider.of<PatientsProvider>(context, listen: false)
          .fetchAndSetPatients();
    }
    void filterSearchResults(text){
      Provider.of<PatientsProvider>(context, listen: false)
          .setSearchText(text);
      _refreshPatients();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
              isAdd: true,
              title: 'Ptients',
              onBack: () {
                Navigator.of(context).pop();
              },
              onAdd: () {
                screenSize.navigateNamed(routName: PatientFormScreen.routName , arguments: ScreenArguments(
                  patient_id: null,
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
                future: _refreshPatients(),
                builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : RefreshIndicator(
                  onRefresh: _refreshPatients,
                  child: Consumer<PatientsProvider>(
                    builder: (context, patientsData, _) => DataList(
                      isPatient: true,
                      data: patientsData.patients,
                      onTap: (value) {
                        personID = value;
                        print(personID);
                        Navigator.of(context).pushNamed(
                            PatientScreen.routName,
                            arguments: personID);
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
