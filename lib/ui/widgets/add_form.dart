import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'text_field_block.dart';
import 'choose_block.dart';
import 'build_future.dart';
import 'package:provider/provider.dart';
import 'package:devida/blocs/providers/util_provider.dart';
import 'package:devida/helpers/database_helper.dart';



class selectionData{
  final int id;
  final String title;

  selectionData({this.id, this.title});

}




class AddForm extends StatefulWidget {
  var data;
  int personID;
  GlobalKey<FormState> formKey;
  Function returniIdentification_number;
  bool isDoctor;
  bool isPatient;


  AddForm({this.data , this.personID , this.formKey , this.returniIdentification_number , this.isDoctor=false , this.isPatient=false});

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {




  DatabaseHelper helper = DatabaseHelper();

  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _secondNameController = TextEditingController();

  TextEditingController _thirdNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _identificationController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _jobController = TextEditingController();

  TextEditingController _noteController = TextEditingController();

  List SocialStatus = [
    selectionData(id:1,title:'Married'),
    selectionData(id:2,title:'Celibate'),
  ];


  @override
  void initState() {
    super.initState();

    _firstNameController.addListener(_saveFirstName);
    _secondNameController.addListener(_saveSecondName);
    _thirdNameController.addListener(_saveThirdName);
    _emailController.addListener(_saveEmail);
    _phoneController.addListener(_savePhone);
    if(widget.personID==null)
    _identificationController.addListener(_saveIdentification);
    _addressController.addListener(_saveAddress);
    _jobController.addListener(_saveJob);
    _noteController.addListener(_saveNote);




    if(widget.personID!=null){


      widget.data.user_role_id = widget.data.user.user_role_id;

      _firstNameController.text=widget.data.first_name;
      _secondNameController.text=widget.data.second_name;
      _thirdNameController.text=widget.data.third_name;
      _emailController.text=widget.data.email;
      _phoneController.text=widget.data.phone;
      _identificationController.text=widget.data.user.identidication_number;
      _addressController.text=widget.data.address;
      _noteController.text=widget.data.notes;
      if(widget.isPatient)
        _jobController.text=widget.data.job;
    }



  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _firstNameController.dispose();
    _secondNameController.dispose();
    _thirdNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _identificationController.dispose();
    _addressController.dispose();
    _jobController.dispose();
    _noteController.dispose();

    super.dispose();
  }

  _saveFirstName() {
   widget.data.first_name=_firstNameController.text.toString();
  }

  _saveSecondName() {
    widget.data.second_name=_secondNameController.text.toString();
  }

  _saveThirdName() {
    widget.data.third_name=_thirdNameController.text.toString();
  }

  _saveEmail() {
    widget.data.email=_emailController.text.toString();
  }

  _savePhone() {
    widget.data.phone=_phoneController.text.toString();
  }

  _saveIdentification() {
    widget.data.identification_number=_identificationController.text.toString();
  }

  _saveAddress() {
    widget.data.address=_addressController.text.toString();
  }

  _saveNote() {
    widget.data.notes=_noteController.text.toString();
  }

  _saveJob() {
    widget.data.job=_jobController.text.toString();
  }


  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Center(
        child: Container(
            width: screenSize.screenWidth(310),
            height: screenSize.screenHight(560),
            color: Colors.transparent,
            child: Form(
              key: this.widget.formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.screenHight(15.0),
                  ),
                  TextFieldBlock(
                    controller: _firstNameController,
                    hintText: 'First Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter First Name',
                    initValue: widget.personID==null?null:widget.data.first_name,
                    onSaved: (value) {
                      //widget.data.first_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller: _secondNameController,
                    hintText: 'Second Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Second Name',
                    initValue: widget.personID==null?null:widget.data.second_name,
                    onSaved: (value) {
                      //widget.data.second_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller:_thirdNameController ,
                    hintText: 'Third Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Third Name',
                    initValue: widget.personID==null?null:widget.data.third_name,
                    onSaved: (value) {
                      //widget.data.third_name = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller: _emailController,
                    hintText: 'Email Name',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Email',
                    initValue: widget.personID==null?null:widget.data.email,
                    onSaved: (value) {
                      //widget.data.email = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Phone Number',
                    initValue: widget.personID==null?null:widget.data.phone,
                    onSaved: (value) {
                      //widget.data.phone = _phoneController.text.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller: _identificationController,
                    hintText: 'Identification Number',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Identification Number',
                    initValue: widget.personID==null?null:widget.data.user.identidication_number,
                    onSaved: (value) {
                      //widget.data.identification_number = value.toString();
                      //returniIdentification_number(value.toString());
                    },
                    readOnly: widget.personID==null?false:true,
                  ),

                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Social Status',
                    title: 'Social Status',
                    utilName: 'social',
                    initialValue: widget.personID==null?null:widget.data.social_status,
                    onSaved: (value) {
                      widget.data.social_status = SocialStatus[value-1].title;
                    },
                  ),

                  widget.isDoctor?
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  )
                      :
                  SizedBox(height: 0.0,)
                  ,
                  widget.isDoctor ?
                  ChooseBlook(
                    dialogTitle: 'Choose Specialization',
                    title: 'Specialization',
                    utilName: 'specialization',
                    helper: helper,
                    initialValue: widget.personID==null?null:widget.data.specialization.title,
                    onSaved: (value) {
                      widget.data.specialization_id = value;
                    },):SizedBox(height: 0.0,),

                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  widget.isPatient?
                  TextFieldBlock(
                    controller: _jobController,
                    hintText: 'Job',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Job title',
                    initValue: widget.personID==null?null:widget.data.job,
                    onSaved: (value) {
                     // widget.data.job = value.toString();
                    },
                  )
//                  ChooseBlook(
//                    dialogTitle: 'Choose Job Title',
//                    title: 'Job Title',
//                    data: patientJobs,
//                    initialValue: personID==null?null:data.job,
//                    onSaved: (value) {
//                      data.job = patientJobs[value-1].title;
//                    },
//                  )
                      :
                  ChooseBlook(
                    dialogTitle: 'Choose Job Title',
                    title: 'Job Title',
                    utilName: 'job',
                    helper: helper,
                    initialValue: widget.personID==null?null:widget.data.job.title,
                    onSaved: (value) {
                      widget.data.job_id = value;
                    },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Gender',
                    title: 'Gender',
                    utilName: 'gender',
                    helper: helper,
                    initialValue: widget.personID==null?null:widget.data.gender.title,
                    onSaved: (value) {
                      widget.data.gender_id = value;
                    },

                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),

                      ChooseBlook(
                        dialogTitle: 'Choose Blood',
                        title: 'Blood',
                        utilName: 'blood',
                        helper: helper,
                        initialValue:widget.personID==null?null: widget.data.blood.title,
                        onSaved: (value) {
                          widget.data.blood_id = value;
                        },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),


                  ChooseBlook(
                    dialogTitle: 'Choose Nationality',
                    title: 'Nationality',
                    utilName: 'nationality',
                    helper: helper,
                    initialValue: widget.personID==null?null:widget.data.nationality.title,
                    onSaved: (value) {
                      widget.data.nationality_id = value;
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Role ',
                    title: 'Role',
                    utilName: 'role',
                    helper: helper,
                    initialValue: widget.personID==null?null:widget.data.user.user_role.toString(),
                    onSaved: (value) {
                      widget.data.user_role_id = value;
                      // print(data.user.user_role_id.toString());
                    },
                  ),


                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  ChooseBlook(
                    dialogTitle: 'Choose Date Of Birth',
                    isDate: true,
                    title: 'Date Of Birth',
                    initialValue:widget.personID==null?null: widget.data.date_of_birth.toString(),
                    onSaved: (value) {
                      widget.data.date_of_birth = value;
                    },),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),

                  TextFieldBlock(
                    controller: _addressController,
                    hintText: 'Address',
                    //height: screenSize.screenHight(37.0),
                    returnValue: 'Please Enter Address',
                    initValue: widget.personID==null?null:widget.data.address,
                    onSaved: (value) {
                      widget.data.address = value.toString();
                    },
                  ),
                  SizedBox(
                    height: screenSize.screenHight(10.0),
                  ),
                  TextFieldBlock(
                    controller: _noteController,
                    hintText: 'Notes',
                    returnValue: null,
                    initValue: widget.personID==null?null:widget.data.notes,
                    onSaved: (value) {
                      widget.data.notes = value.toString();
                    },
                  ),

//                  TextFieldBlock(
//                    hintText: 'Image',
//                    height: screenSize.screenHight(37.0),
//                    returnValue: null,
//                    initValue: personID==null?null:data.image,
//                    onSaved: (value) {
//                      data.image = value.toString();
//                    },
//                  ),
                ],
              ),
            )),
      )
    ;
  }
}
