import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';


import 'package:provider/provider.dart';

import 'add_person.dart';
import 'diagnose_screen.dart';
import 'diagnose_form_screen.dart';

import 'package:devida/blocs/models/thing_extension.dart';
import 'package:devida/blocs/providers/Diagnose_provider.dart';

class DiagnosesScreen extends StatelessWidget {
  static const routName = '/diagnoses';
  int diagnoseID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);

    Future<void> _refreshDiagnoses() async {
      await Provider.of<DiagnoseProvider>(context, listen: false)
          .fetchAndSetDiagnoses();
    }
    void filterSearchResults(text){
      Provider.of<DiagnoseProvider>(context, listen: false)
          .setSearchText(text);
      _refreshDiagnoses();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
              isAdd: true,
              title: 'Diagnoses',
              onBack: () {
                Navigator.of(context).pop();
              },
              onAdd: () {
                Navigator.of(context).pushNamed(
                    DiagnoseFormScreen.routName,
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
                future: _refreshDiagnoses(),
                builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : RefreshIndicator(
                  onRefresh: _refreshDiagnoses,
                  child: Consumer<DiagnoseProvider>(
                    builder: (context, diagnosesData, _) => DataList(
                      isExtension: true,
                      data: diagnosesData.diagnoses,
                      onTap: (value) {
                        diagnoseID = value;
                        print(diagnoseID);
                        Navigator.of(context).pushNamed(
                            DiagnoseScreen.routName,
                            arguments: diagnoseID);
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
