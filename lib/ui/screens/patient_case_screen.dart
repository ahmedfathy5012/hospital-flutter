import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/date_show.dart';
import '../widgets/list_item.dart';
import '../widgets/used_button.dart';
import '../widgets/build_future.dart';

import 'diagnose_screen.dart';
import 'diagnose_form_screen.dart';

import 'package:provider/provider.dart';

import 'package:devida/blocs/providers/patient_provider.dart';

class PatientCaseScreen extends StatelessWidget {
  static const routName = '/patient_case';
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    final patientCaseID = ModalRoute.of(context).settings.arguments as int;
    Future<bool> _refreshPatient(int patientCaseID) async {
    return await Provider.of<PatientProvider>(context, listen: false)
          .fetchAndSetPatientCase(patientCaseID);
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            isBack:true,
            title: 'Patient Case',
            onDelete: () {},
            onEdit: () {
//              Navigator.of(context).pushNamed(
//                  PatientFormScreen.routName,
//                  arguments: patientID);
            },
            onBack: () {
              Navigator.of(context).pop();
            },
          )),
      body: BuildFuture(
        fetchData: _refreshPatient,
        id: patientCaseID,
        child:  RefreshIndicator(
          onRefresh: () => _refreshPatient(patientCaseID),
          child: Consumer<PatientProvider>(
            builder: (context, caseData, _) => Column(
              children: <Widget>[
                SizedBox(
                  height: screenSize.screenHight(15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DateShow(
                      title: 'Entry',
                      subtitle: caseData.patientCase.entry_date,
                    ),
                    DateShow(
                      title: 'Exit',
                      subtitle: caseData.patientCase.exit_date,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.screenHight(15.0),
                ),
                Text(
                  '${caseData.patientCase.diagnoses.length} Diagnoses',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff1749A2),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'bahnschrift'),
                ),
                SizedBox(
                  height: screenSize.screenHight(15.0),
                ),
                Container(
                  width: double.infinity,
                  height: screenSize.screenHight(350.0),
                  color: Colors.transparent,
                  child: Padding(
                    padding:
                    EdgeInsets.all(screenSize.screenWidth(15.0)),
                    child: ListView.builder(
                      itemCount: caseData.patientCase.diagnoses.length,
                      itemBuilder: (context, index) => ListItem(
                        title: caseData.patientCase.diagnoses[index].name,
                        subTitle: caseData.patientCase.diagnoses[index].content,
                        image: 'assets/images/3.png',
                        onTap: (value) {
                          Navigator.of(context).pushNamed(
                              DiagnoseScreen.routName,
                              arguments: caseData.patientCase.diagnoses[index].id);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.screenHight(15.0),
                ),
                UsedButton(
                  title: 'Add Diagnose',
                  width: 250.0,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        DiagnoseFormScreen.routName,
                        arguments: ScreenArguments(
                            patient_case_id: patientCaseID
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
