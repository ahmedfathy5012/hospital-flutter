import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_upper.dart';
import '../widgets/info_basic.dart';
import '../widgets/info_container.dart';
import '../widgets/used_button.dart';

import 'patient_form_screen.dart';
import 'surgery_screen.dart';
import 'patient_case_screen.dart';
import 'surgery_form_screen.dart';
import 'diagnose_form_screen.dart';

import 'package:devida/blocs/models/patient.dart';
import 'package:devida/blocs/providers/patient_provider.dart';
import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';
import 'package:devida/helpers/screen_arguments.dart';

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
              screenSize.navigateNamed(routName: PatientFormScreen.routName , arguments: ScreenArguments(
                patient_id: patientID,
              ));
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
          child:
          Consumer<PatientProvider>(
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
                              InfoContainer(
                                isCase: true,
                                icon: 'assets/icons/24.png',
                                subtitle: 'Cases',
                                data: patientData.patient.patient_cases,
                                onTap: (caseID){
                                  Navigator.of(context).pushNamed(
                                      PatientCaseScreen.routName,
                                      arguments: caseID);
                                },
                              ),
                              InfoContainer(
                                icon: 'assets/icons/27.png',
                                subtitle: 'Surgery',
                                data: patientData.patient.surgery,
                                onTap: (surgeryID){
                                  Navigator.of(context).pushNamed(
                                      SurgeryScreen.routName,
                                      arguments: surgeryID);
                                },
                              ),
                              SizedBox(
                                height: screenSize.screenHight(15.0),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: screenSize.screenWidth(20.0)),
                                child: UsedButton(
                                  title: 'Add Diagnose',
                                  width: 250.0,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        DiagnoseFormScreen.routName,
                                        arguments: ScreenArguments(
                                            patient_id: patientID
                                        ));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenSize.screenHight(15.0),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: screenSize.screenWidth(20.0)),
                                child: UsedButton(
                                  title: 'Add Surgery',
                                  width: 250.0,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        SurgeryFormScreen.routName,
                                        arguments: ScreenArguments(
                                          patient_id: patientID
                                        ));
                                  },
                                ),
                              ),
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
