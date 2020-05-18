import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_upper.dart';
import '../widgets/info_basic.dart';
import '../widgets/info_container.dart';

import './nurse_form_screen.dart';


import 'package:devida/blocs/providers/nurse_peovider.dart';
import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

class NurseScreen extends StatelessWidget {
  static const routName = '/nurse';
  @override
  Widget build(BuildContext context) {
    final nurseID = ModalRoute.of(context).settings.arguments as int;


    Future<void> _refreshNurse(int doctorId) async {
      await Provider.of<NurseProvider>(context, listen: false).fetchAndSetNurse(nurseID);
    }

    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            title: 'Nurse',
            onDelete: () {},
            onEdit: () {
             screenSize.navigateNamed(routName: NurseFormScreen.routName , arguments: ScreenArguments(
               nurse_id: nurseID,
             ));
            },
            onBack: (){
              Navigator.of(context).pop();
            },
          )),
      body: FutureBuilder(
        future: _refreshNurse(nurseID),
        builder: (context,snapshot)=>snapshot.connectionState == ConnectionState.waiting
            ? Center(
          child: CircularProgressIndicator(),
        ):RefreshIndicator(
          onRefresh: () => _refreshNurse(nurseID),
          child: Consumer<NurseProvider>(
            builder: (context,nurseData,_)=>
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: screenSize.screenHight(8.0),
                      ),
                      InfoUpper(
                        title: nurseData.nurse.full_name,
                        subtitle: nurseData.nurse.job.job_name,
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
                              InfoBasic(data: nurseData.nurse),
                              SizedBox(
                                height: screenSize.screenHight(15.0),
                              ),
                              InfoContainer(
                                icon: 'assets/icons/19.png',
                                subtitle: 'Notes',
                                isNote: true,
                                notes: nurseData.nurse.notes,
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
