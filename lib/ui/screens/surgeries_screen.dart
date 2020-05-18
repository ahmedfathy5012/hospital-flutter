import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';

import 'package:provider/provider.dart';


import 'surgery_screen.dart';
import 'surgery_form_screen.dart';

import 'package:devida/blocs/models/thing_extension.dart';
import 'package:devida/blocs/providers/surgery_provider.dart';

class SurgeriesScreen extends StatelessWidget {
  static const routName = '/surgeries';
  int surgeryID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);

    Future<void> _refreshSurgery() async {
      await Provider.of<SurgeryProvider>(context, listen: false)
          .fetchAndSetSurgeries();
    }
    void filterSearchResults(text){
      Provider.of<SurgeryProvider>(context, listen: false)
          .setSearchText(text);
      _refreshSurgery();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
              isAdd: true,
              title: 'Surgery',
              onBack: () {
                Navigator.of(context).pop();
              },
              onAdd: () {
                Navigator.of(context).pushNamed(
                    SurgeryFormScreen.routName,
                    arguments: ScreenArguments());
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
              FutureBuilder(
                future: _refreshSurgery(),
                builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : RefreshIndicator(
                  onRefresh: _refreshSurgery,
                  child: Consumer<SurgeryProvider>(
                    builder: (context, diagnosesData, _) => DataList(
                      isExtension: true,
                      data: diagnosesData.surgeries,
                      onTap: (value) {
                        surgeryID = value;
                        print(surgeryID);
                        Navigator.of(context).pushNamed(
                            SurgeryScreen.routName,
                            arguments: surgeryID);
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
