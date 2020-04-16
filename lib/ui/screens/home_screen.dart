import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                crossAxisSpacing:screenSize.screenWidth(13),
                mainAxisSpacing: screenSize.screenWidth(13),
            ),
          children: <Widget>[
            GridItem(count: 100, title: 'Doctor', onTap: (){print('hello');}),
            GridItem(count: 100, title: 'Doctor', onTap: (){}),
            GridItem(count: 100, title: 'Doctor', onTap: (){}),
            GridItem(count: 100, title: 'Doctor', onTap: (){}),
            GridItem(count: 100, title: 'Doctor', onTap: (){}),
          ],
        ),
      ),
    );
  }
}
