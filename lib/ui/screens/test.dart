import 'package:flutter/material.dart';
import 'package:devida/blocs/providers/patient_provider.dart';
import 'package:devida/blocs/models/patient.dart';
import 'package:provider/provider.dart';
import 'package:devida/helpers/database_helper.dart';
import 'package:devida/blocs/providers/util_provider.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  DatabaseHelper helper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    Future<void> _refreshDoctor() async {
      return await Provider.of<UtilProvider>(context, listen: false).fetchSpecializations(helper);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.access_alarm), onPressed: (){
            _refreshDoctor();
          })
        ],
      ),
    );
  }
}
