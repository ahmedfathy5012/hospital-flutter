import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';

import 'package:flutter/material.dart';

import 'package:devida/helpers/screen_helper.dart';

import 'search_bar.dart';
import 'build_future.dart';

import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/doctors_provider.dart';
import 'package:devida/blocs/providers/patients_provider.dart';
import 'package:devida/blocs/providers/anesthetics_provider.dart';
import 'package:devida/blocs/providers/util_provider.dart';
import 'package:devida/helpers/database_helper.dart';


import 'package:devida/blocs/models/doctors.dart';





class ChooseBlook extends StatefulWidget {

   ChooseBlook({
    @required this.title,
    this.isDate=false,
     this.dialogTitle,
     this.onSaved,
     this.height=37.0,
     this.initialValue,
     this.data,
     this.isSearch = false,
     this.isPatient = false,
     this.isAnesthetic=false,
     this.helper,
     this.utilName

  }) ;
  final String title;
  final bool isDate;
  final String dialogTitle;
  final Function onSaved;
  final String initialValue;
  final List data;
  final double height;
  final bool isSearch;
  final bool isPatient;
  final bool isAnesthetic;
  String utilName;
  DatabaseHelper helper;


  @override
  _ChooseBlookState createState() => _ChooseBlookState();
}

class _ChooseBlookState extends State<ChooseBlook> {
  String choosenTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    choosenTitle = widget.initialValue;

  }
  ScreenHelper screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = ScreenHelper(context);

    Future<bool> _refreshUtil()async{
      var baseData = Provider.of<UtilProvider>(context,listen: false);
      if(widget.utilName=='blood'){
        await Provider.of<UtilProvider>(context,listen: false).fetchBlood(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchBlood(widget.helper);
        }
        return true;
    }else if(widget.utilName=='specialization'){
        await Provider.of<UtilProvider>(context,listen: false).fetchSpecializations(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchSpecializations(widget.helper);
        }
        return true;
      }else if(widget.utilName=='nationality'){
        await Provider.of<UtilProvider>(context,listen: false).fetchNationalities(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchNationalities(widget.helper);
        }
        return true;
      }else if(widget.utilName=='job'){
        await Provider.of<UtilProvider>(context,listen: false).fetchJobs(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchJobs(widget.helper);
        }
        return true;
      }else if(widget.utilName=='gender'){
        await Provider.of<UtilProvider>(context,listen: false).fetchGenders(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchGenders(widget.helper);
        }
        return true;
      }else if(widget.utilName=='social'){
        return true;
      }else if(widget.utilName=='role'){
        await Provider.of<UtilProvider>(context,listen: false).fetchRoles(widget.helper);
        if(baseData.blood.isEmpty){
          await Provider.of<UtilProvider>(context,listen: false).fetchRoles(widget.helper);
        }
        return true;
      }
    }

    Future<void> refreshDoctors() async {
      await Provider.of<DoctorsProvider>(context, listen: false)
          .fetchAndSetDoctors();
    }
    void filterDoctorSearchResults(text){
      Provider.of<DoctorsProvider>(context, listen: false)
          .setSearchText(text);
      refreshDoctors();
    }

    Future<void> refreshPatients() async {
      await Provider.of<PatientsProvider>(context, listen: false)
          .fetchAndSetPatients();
    }

    void filterPatientSearchResults(text){
      Provider.of<PatientsProvider>(context, listen: false)
          .setSearchText(text);
      refreshPatients();
    }

    Future<void> refreshAnesthetics() async {
      await Provider.of<AnestheticsProvider>(context, listen: false)
          .fetchAndSetAnesthetics();
    }

    void filterAnestheticSearchResults(text){
      Provider.of<AnestheticsProvider>(context, listen: false)
          .setSearchText(text);
      refreshAnesthetics();
    }


    void _showListDialog(){
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BuildFuture(
               fetchData: _refreshUtil,
               child: Consumer<UtilProvider>(
                 builder: (context,utilsData,_){
                   var utilData;
                   if(widget.utilName=='blood')
                     utilData=utilsData.blood;
                   else if(widget.utilName=='specialization')
                     utilData=utilsData.specializations;
                   else if(widget.utilName=='nationality')
                     utilData=utilsData.nationalities;
                   else if(widget.utilName=='job')
                     utilData=utilsData.jobs;
                   else if(widget.utilName=='gender')
                     utilData=utilsData.gender;
                   else if(widget.utilName=='social')
                     utilData=utilsData.socialStatus;
                   else if(widget.utilName=='role')
                     utilData=utilsData.roles;

                   return AlertDialog(
                     title: Text(widget.dialogTitle,style: TextStyle(fontSize: 25.0,color: Color(0XFF5CA7E0)),),
                     content: SingleChildScrollView(
                         child: Container(
                           width: screenSize.screenWidth(200.0),
                           height: screenSize.screenHight(150.0),
                           color: Colors.transparent,
                           child: ListView.builder(
                             itemCount: utilData.length,
                             itemBuilder: (context,index)=>Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: <Widget>[
                                 SizedBox(height: screenSize.screenHight(5.0),),
                                 GestureDetector(
                                     onTap: (){
                                       widget.onSaved(utilData[index].id);
                                       setState(() {
                                         choosenTitle = utilData[index].title;
                                         Navigator.of(context).pop();
                                       });
                                     },
                                     child: Text(utilData[index].title,style: TextStyle(fontSize: 11.0,color: Color(0XFF1749A2)),)
                                 ),
                                 SizedBox(height: screenSize.screenHight(5.0),),
                                 Divider(),
                               ],
                             ),
                           ),
                         )
                     ),
                     actions: <Widget>[
                       FlatButton(
                         child: Text('Cancel',style: TextStyle(fontSize: 11.0,color: Color(0XFF1749A2))),
                         onPressed: () {
                           Navigator.of(context).pop();
                         },
                       ),
                     ],
                   );
                 }
               ),
          );
        },
      );
    }


    Widget consumerContainer(var personData){
      return Container(
        width: screenSize.screenWidth(250.0),
        height: screenSize.screenHight(400.0),
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: personData.length,
          itemBuilder: (context,index)=>GestureDetector(
            onTap: (){
              widget.onSaved(personData[index].id);
              setState(() {
                widget.isAnesthetic?
                choosenTitle =  personData[index].title
                    :
                choosenTitle =  personData[index].fullName;
                Navigator.of(context).pop();
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                widget.isAnesthetic?
                Text(personData[index].title,style: TextStyle(fontSize: 15.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),)
                    :
                ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/images/3.png'),
                  ),
                  title: Text(personData[index].fullName,style: TextStyle(fontSize: 15.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
    }

    void _showSearchDialog(){
      print('id is  ${widget.initialValue}');
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return
            AlertDialog(
              title: Text(widget.dialogTitle,style: TextStyle(fontSize: 25.0,color: Color(0XFF5CA7E0)),),
              content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SearchBar(
                        onChanged: (text){
                         widget.isPatient ?
                         filterPatientSearchResults(text)
                             :
                         widget.isAnesthetic ?
                         filterAnestheticSearchResults(text)
                             :
                         filterDoctorSearchResults(text);
                        },
                      ),
                      SizedBox(height: screenSize.screenHight(15.0),),
                      FutureBuilder(
                        future: widget.isPatient ? refreshPatients() : (widget.isAnesthetic ? refreshAnesthetics() : refreshDoctors()),
                        builder: (context,snapshot)=>snapshot.connectionState==ConnectionState.waiting ?
                        CircularProgressIndicator()
                            :
                        RefreshIndicator(
                          onRefresh: widget.isPatient ? refreshPatients : refreshDoctors,
                            child: widget.isPatient ?
                            Consumer<PatientsProvider>
                              (
                              builder: (context,personData,ch)=> consumerContainer(personData.patients)
                            ):
                            widget.isAnesthetic ?
                            Consumer<AnestheticsProvider>
                              (
                                builder: (context,anestheticData,ch)=> consumerContainer(anestheticData.anesthetics)
                            ):
                            Consumer<DoctorsProvider>
                            (
                            builder: (context,personData,ch)=> consumerContainer(personData.doctors)
                             ),
                            ),
                      ),
                    ],
                  )
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel',style: TextStyle(fontSize: 11.0,color: Color(0XFF1749A2))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
        },
      );
    }


    return Container(
      width: widget.isDate ? screenSize.screenWidth(100.0) : screenSize
          .screenWidth(290.0),
      height: screenSize.screenHight(widget.height),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Color(0XFF1749A2),
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(23.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          widget.isDate? _selectDate():widget.isSearch ? _showSearchDialog() : _showListDialog();
        },
        child: Padding(
            padding:  EdgeInsets.only(left: 15.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width:  screenSize.screenWidth(200.0),
                  height: screenSize.screenHight(37.0),
                  child: choosenTitle == null ?
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.screenWidth(0.0)),
                    child: Text(widget.title,
                      style: TextStyle(
                          color: Color(0XFFA2A2A2),
                          fontSize: 20.0
                      ),
                    ),
                  )
                      :

                  Text(choosenTitle,
                    style: TextStyle(
                        color: Color(0XFF1749A2),
                        fontSize: 20.0
                    ),
                  ),

                ),
                Icon(Icons.keyboard_arrow_down, color: Color(0XFF1749A2),)
              ],
            )
        ),
      ),
    );
  }







  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2024)
    );
    if(picked != null) setState((){

      setState(() {
        print(picked.toString());
        choosenTitle = "${picked.year}-${picked.month}-${picked.day}";
      });
      widget.onSaved(picked.toString());
    });
  }


}