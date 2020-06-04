import 'package:flutter/material.dart';
import 'no_connection.dart';
class BuildFuture extends StatelessWidget {

  int id=null;
  Function fetchData;
  Widget child;

  BuildFuture({this.fetchData,this.child ,this.id});
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: id==null ? fetchData() : fetchData(id),
      builder: (context,snapshot){
        switch(snapshot.connectionState)
          {
          case ConnectionState.none:
            return NoConnection();
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
           return Center(child: CircularProgressIndicator(),);
            break;
          case ConnectionState.done:
            if(!snapshot.data){
              return NoConnection();
            }else{
              return child;
            }
            break;
          default:
            return NoConnection();
        }
      },
    );
  }
}
