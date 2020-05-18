import 'package:flutter/material.dart';
import 'package:devida/blocs/providers/patient_provider.dart';
import 'package:devida/blocs/models/patient.dart';
import 'package:provider/provider.dart';
class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<void> _refreshDoctor(int doctorId) async {
      await Provider.of<PatientProvider>(context,listen: false).fetchAndSetPatient(doctorId);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: (){_refreshDoctor(2);}),
      ),
      body: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (index){
          print('ahmed');
        },
              itemExtent: 200,
              childDelegate: ListWheelChildBuilderDelegate(
                 childCount:10 ,
                  builder: (context,index)=>buildGestureDetector(),
              )
          )
    );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
                onTap: (){
                  print('ahmed');
                },
                child: Container(
                  color: Colors.red,
                  child: Center(
                    child: IconButton(icon: Icon(Icons.save), onPressed: (){print('ahmed');}),
                  ),
                ),
              );
  }
}
