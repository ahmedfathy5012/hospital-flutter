import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';
import '../widgets/build_future.dart';

import 'package:provider/provider.dart';


import 'add_person.dart';

import 'package:devida/blocs/models/doctors.dart';

import 'package:devida/blocs/providers/doctors_provider.dart';

import 'doctor_screen.dart';



class DoctorsScreen extends StatelessWidget {
  static const routName = '/doctors';
  int doctorID;
  List<Doctors> data;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);

    Future<bool> _refreshDoctors() async {
     return  await Provider.of<DoctorsProvider>(context, listen: false)
          .fetchAndSetDoctors();
    }
    void filterSearchResults(text){
      Provider.of<DoctorsProvider>(context, listen: false)
          .setSearchText(text);
      _refreshDoctors();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
            isAdd: true,
              title: 'Doctors',
              onBack: () {
               Navigator.of(context).pop();
              },
              onAdd: () {
               screenSize.navigateNamed(routName: AddPerson.routName , arguments: ScreenArguments(
                 doctor_id: null,
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
              BuildFuture(
                fetchData: _refreshDoctors,
                child: RefreshIndicator(
                  onRefresh: _refreshDoctors,
                  child: Consumer<DoctorsProvider>(
                    builder: (context,doctorsData,_)=> DataList(
                      isDoctor: true,
                      data: doctorsData.doctors,
                      onTap: (value) {
                        doctorID = value;
                        print(doctorID);
                        Navigator.of(context).pushNamed(
                            DoctorScreen.routName,
                            arguments: doctorID);
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
