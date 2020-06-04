import 'package:devida/helpers/screen_helper.dart';
import 'package:devida/helpers/screen_arguments.dart';

import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../widgets/data_list.dart';
import '../widgets/draw_drawer.dart';
import '../widgets/build_future.dart';

import 'package:provider/provider.dart';


import 'nurse_form_screen.dart';



import 'package:devida/blocs/providers/nurses_provider.dart';

import 'nurse_screen.dart';

class NursesScreen extends StatelessWidget {
  static const routName = '/nurses';

  int nurseID;

  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    Future<bool> _refreshNurses() async {
     return await Provider.of<NursesProvider>(context, listen: false)
          .fetchAndSetNurses();
    }
    void filterSearchResults(text){
      Provider.of<NursesProvider>(context, listen: false)
          .setSearchText(text);
      _refreshNurses();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DrawAppBar(
              isAdd: true,
              title: 'Nurses',
              onBack: () {
                Navigator.of(context).pop();
              },
              onAdd: () {
                screenSize.navigateNamed(routName: NurseFormScreen.routName , arguments: ScreenArguments(
                  nurse_id: null,
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
                fetchData: _refreshNurses,
                child: RefreshIndicator(
                  onRefresh: _refreshNurses,
                  child: Consumer<NursesProvider>(
                    builder: (context, nursesData, _) => DataList(
                      isEmployee: true,
                      data: nursesData.doctors,
                      onTap: (value) {
                        nurseID = value;
                        print(nurseID);
                        Navigator.of(context).pushNamed(
                            NurseScreen.routName,
                            arguments: nurseID);
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
