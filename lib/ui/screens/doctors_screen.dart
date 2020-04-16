import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/list_item.dart';
import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';

import 'add_person.dart';

import 'package:devida/blocs/models/doctors.dart';

import 'package:devida/blocs/providers/doctors_provider.dart';

import 'doctor_screen.dart';

class DoctorsScreen extends StatelessWidget {
  String title = 'Doctors';
  String subTitle = 'doctor';
  Function onBack;
  Function onAdd;
  int doctorID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    List<Doctors> data =
        Provider.of<DoctorsProvider>(context, listen: false).doctors;
    Future<void> _refreshDoctors() async {
      await Provider.of<DoctorsProvider>(context, listen: false)
          .fetchAndSetDoctors();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
            isAdd: true,
              title: 'Doctors',
              onBack: () {
                Provider.of<DoctorsProvider>(context, listen: false)
                    .fetchAndSetDoctors();
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
              future: _refreshDoctors(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: _refreshDoctors,
                          child: Consumer<DoctorsProvider>(
                            builder: (context, doctorsData, _) => DataList(
                              data: doctorsData.doctors,
                              onTap: (value) {
                                doctorID = value;
                                print(doctorID);
                                Navigator.of(context).pushNamed(
                                    DoctorScreen.routName,
                                    arguments: doctorID);
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => DoctorScreen()),
//              );
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
