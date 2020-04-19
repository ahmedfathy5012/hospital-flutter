import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_upper.dart';
import '../widgets/info_basic.dart';
import '../widgets/info_container.dart';

import 'add_person.dart';

import 'package:devida/blocs/models/patient.dart';
import 'package:devida/blocs/providers/patient_provider.dart';
import 'package:devida/helpers/screen_helper.dart';

class PatientScreen extends StatelessWidget {
  static const routName = '/patient';
  @override
  Widget build(BuildContext context) {
    final patientID = ModalRoute.of(context).settings.arguments as int;

    Patient data =
        Provider.of<PatientProvider>(context, listen: false).patient;


    Future<void> _refreshPatient(int patientId) async {
      await Provider.of<PatientProvider>(context, listen: false).fetchAndSetPatient(patientId);
    }

    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            title: 'Patient',
            onDelete: () {},
            onEdit: () {
              Navigator.of(context).pushNamed(
                  AddPerson.routName,
                  arguments: patientID);
            },
            onBack: (){
            Navigator.of(context).pop();
            },
          )),
      body: FutureBuilder(
        future: _refreshPatient(patientID),
        builder: (context,snapshot)=>snapshot.connectionState == ConnectionState.waiting
            ? Center(
          child: CircularProgressIndicator(),
        ):RefreshIndicator(
          onRefresh: () => _refreshPatient(patientID),
          child: Consumer<PatientProvider>(
            builder: (context,patientData,_)=>
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: screenSize.screenHight(8.0),
                      ),
                      InfoUpper(
                        title: patientData.patient.full_name,
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
                              InfoBasic(data: patientData.patient , isPatient: true,),
                              SizedBox(
                                height: screenSize.screenHight(15.0),
                              ),
                              InfoContainer(
                                icon: 'assets/icons/19.png',
                                subtitle: 'Notes',
                                isNote: true,
                                notes: patientData.patient.notes,
                              ),
//                              InfoContainer(
//                                icon: 'assets/icons/19.png',
//                                subtitle: 'Dignoses',
//                                data: doctorData.doctor.diagnoses,
//                                onTap: (){
//                                  print('ahmed');
//                                },
//                              ),
//                              InfoContainer(
//                                icon: 'assets/icons/19.png',
//                                subtitle: 'Surgery',
//                                data: doctorData.doctor.diagnoses,
//                                onTap: (){
//                                  print('ahmed Fathy');
//                                },
//                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
