import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_upper.dart';
import '../widgets/info_basic.dart';
import '../widgets/info_container.dart';

import 'add_person.dart';
import 'diagnose_screen.dart';
import 'surgery_screen.dart';

import 'package:devida/blocs/models/doctor.dart';
import 'package:devida/blocs/providers/doctor_provider.dart';
import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

class DoctorScreen extends StatelessWidget {
  static const routName = '/doctor';
  @override
  Widget build(BuildContext context) {
    final doctorID = ModalRoute.of(context).settings.arguments as int;

    Doctor data =
        Provider.of<DoctorProvider>(context, listen: false).doctor;


    Future<void> _refreshDoctor(int doctorId) async {
      await Provider.of<DoctorProvider>(context, listen: false).fetchAndSetDoctor(doctorId);
    }
    
    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            title: 'Doctor',
            onDelete: () {},
            onEdit: () {
              screenSize.navigateNamed(routName: AddPerson.routName , arguments: ScreenArguments(
                doctor_id: doctorID,
              ));
            },
            onBack: (){
              Navigator.of(context).pop();
            },
          )),
      body: FutureBuilder(
        future: _refreshDoctor(doctorID),
        builder: (context,snapshot)=>snapshot.connectionState == ConnectionState.waiting
            ? Center(
          child: CircularProgressIndicator(),
        ):RefreshIndicator(
          onRefresh: () => _refreshDoctor(doctorID),
        child: Consumer<DoctorProvider>(
          builder: (context,doctorData,_)=>
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenSize.screenHight(8.0),
                ),
                InfoUpper(
                  title: doctorData.doctor.full_name,
                  subtitle: doctorData.doctor.specialization.specialization_name,
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
                        InfoBasic(data: doctorData.doctor),
                        SizedBox(
                          height: screenSize.screenHight(30.0),
                        ),
                        InfoContainer(
                          icon: 'assets/icons/19.png',
                          subtitle: 'Notes',
                          isNote: true,
                          notes: doctorData.doctor.notes,
                        ),
                        InfoContainer(
                          icon: 'assets/icons/24.png',
                          subtitle: 'Dignoses',
                          data: doctorData.doctor.diagnoses,
                          onTap: (diagnoseID){
                            Navigator.of(context).pushNamed(
                                DiagnoseScreen.routName,
                                arguments: diagnoseID);
                          },
                        ),
//                        InfoContainer(
//                          icon: 'assets/icons/27.png',
//                          subtitle: 'Surgery',
//                          data: doctorData.doctor.surgery,
//                          onTap: (surgeryID){
//                            Navigator.of(context).pushNamed(
//                                SurgeryScreen.routName,
//                                arguments: surgeryID);
//                          },
//                        ),
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
