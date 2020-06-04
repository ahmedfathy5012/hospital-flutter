import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_item.dart';
import '../widgets/info_container.dart';
import '../widgets/build_future.dart';


import 'diagnose_form_screen.dart';

import 'package:devida/blocs/providers/Diagnose_provider.dart';

class DiagnoseScreen extends StatelessWidget {
  static const routName = '/diagnose';
  @override
  Widget build(BuildContext context) {
    final diagnoseID = ModalRoute.of(context).settings.arguments as int;
    ScreenHelper screenSize = ScreenHelper(context);
    Future<bool> _refreshDiagnose(int diagnoseID) async {
      return await Provider.of<DiagnoseProvider>(context, listen: false)
          .fetchAndSetDiagnose(diagnoseID);
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Diagnose',
            onDelete: () {},
            onEdit: () {
              Navigator.of(context).pushNamed(
                  DiagnoseFormScreen.routName,
                  arguments:
                  ScreenArguments(
                    diagnose_id: diagnoseID
                  )
              );
            },
            onBack: () {
              Navigator.of(context).pop();
            },
          )),
      body: BuildFuture(
        id: diagnoseID ,
        fetchData: _refreshDiagnose,
        child: Consumer<DiagnoseProvider>(
          builder: (context, diagnoseData, _) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenSize.screenHight(8.0),
                ),
                Center(
                  child: Container(
                    height: screenSize.screenHight(174.0),
                    width: screenSize.screenWidth(187.0),
                    child: Image.asset(
                      'assets/icons/36.png',
                      fit: BoxFit.cover,
                    ),
                  ),
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
                        Padding(
                          padding:  EdgeInsets.only(left: screenSize.screenWidth(10.0)),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: screenSize.screenHight(15.0),
                              ),
                              InfoItem(
                                  title: diagnoseData.diagnose.doctor_name,
                                  subtitle: 'Doctor',
                                  icon: 'assets/icons/29.png'
                              ),
                              SizedBox(height: screenSize.screenHight(15.0),),
                              InfoItem(
                                  title: diagnoseData.diagnose.patient_name,
                                  subtitle: 'Patient',
                                  icon: 'assets/icons/33.png'
                              ),
                              SizedBox(height: screenSize.screenHight(15.0),),
                              InfoItem(
                                  title: diagnoseData.diagnose.patient_name,
                                  subtitle: 'Date',
                                  icon: 'assets/icons/13.png'
                              ),
                            ],
                           crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        SizedBox(height: screenSize.screenHight(15.0),),
                        Column(
                          children: <Widget>[
                            InfoContainer(
                              icon: 'assets/icons/24.png',
                              subtitle: 'Diagnose',
                              isNote: true,
                              notes: diagnoseData.diagnose.diagnose,
                            ),
                            SizedBox(height: screenSize.screenHight(15.0),),
                            InfoContainer(
                              icon: 'assets/icons/30.png',
                              subtitle: 'Drugs',
                              isNote: true,
                              notes: diagnoseData.diagnose.drugs,
                            ),
                          ],
                        )
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
