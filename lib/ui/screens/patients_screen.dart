import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';


import 'package:provider/provider.dart';

import 'add_person.dart';
import 'patient_screen.dart';

import 'package:devida/blocs/models/patients.dart';
import 'package:devida/blocs/providers/patients_provider.dart';

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
                Navigator.of(context).pushNamed(
                    AddPerson.routName,
                    arguments: null);
              })),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: screenSize.screenHight(13.0),
            ),
            SearchBar(),
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
    );
  }
}
