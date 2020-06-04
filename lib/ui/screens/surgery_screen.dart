import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';
import '../widgets/info_item.dart';
import '../widgets/info_container.dart';
import '../widgets/build_future.dart';

import 'package:devida/helpers/screen_arguments.dart';

import 'surgery_form_screen.dart';
import 'package:devida/blocs/providers/surgery_provider.dart';

class SurgeryScreen extends StatelessWidget {
  static const routName = '/surgery';
  @override
  Widget build(BuildContext context) {
    final surgeryID = ModalRoute.of(context).settings.arguments as int;
    ScreenHelper screenSize = ScreenHelper(context);
    Future<bool> _refreshSurgery(int surgeryID) async {
      return await Provider.of<SurgeryProvider>(context, listen: false)
          .fetchAndSetSurgery(surgeryID);
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.screenHight(50.0)),
          child: DrawAppBar(
            isBack: true,
            title: 'Surgery',
            onDelete: () {},
            onEdit: () {
              Navigator.of(context).pushNamed(
                  SurgeryFormScreen.routName,
                  arguments: ScreenArguments(
                    surgery_id: surgeryID
                  ));
            },
            onBack: () {
              Navigator.of(context).pop();
            },
          )),
      body: BuildFuture(
        fetchData: _refreshSurgery,
        id: surgeryID,
        child: Consumer<SurgeryProvider>(
      builder: (context, surgeryData, _) => Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: screenSize.screenHight(8.0),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Container(
                height: screenSize.screenHight(174.0),
                width: screenSize.screenWidth(187.0),
                child: Image.asset(
                  'assets/icons/34.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenSize.screenHight(13.0),),
              Text(surgeryData.surgery.name_of_surgery,style: TextStyle(fontSize: 25.0,color: Color(0xff1749A2),fontWeight: FontWeight.w700,fontFamily: 'bahnschrift'),),
              SizedBox(height: screenSize.screenHight(5.0),),
              Text('Surgery Name',style: TextStyle(fontSize: 18.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
            ],
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
            height: screenSize.screenHight(250.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: screenSize.screenHight(15.0),
                ),
                InfoItem(
                    title: surgeryData.surgery.surgeon_name,
                    subtitle: 'Sergeon',
                    icon: 'assets/icons/27.png'
                ),
                SizedBox(height: screenSize.screenHight(15.0),),
                InfoItem(
                    title: surgeryData.surgery.anesthesiologist_name,
                    subtitle: 'Anesthetist',
                    icon: 'assets/icons/32.png'
                ),
                SizedBox(height: screenSize.screenHight(15.0),),
                InfoItem(
                    title: surgeryData.surgery.anesthetic,
                    subtitle: 'Anesthetic',
                    icon: 'assets/icons/28.png'
                ),
                SizedBox(height: screenSize.screenHight(15.0),),
                InfoItem(
                    title: surgeryData.surgery.patient_name,
                    subtitle: 'Patient',
                    icon: 'assets/icons/33.png'
                ),
                SizedBox(height: screenSize.screenHight(15.0),),
                InfoItem(
                    title: surgeryData.surgery.date_of_surgery,
                    subtitle: 'Date Of Surgery',
                    icon: 'assets/icons/13.png'
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
    );
  }
}
