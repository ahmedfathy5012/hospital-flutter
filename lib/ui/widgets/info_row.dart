import 'package:flutter/material.dart';

import 'info_item.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({

    @required this.leftTitle,
    @required this.leftSubtitle,
    @required this.leftIcon,
    @required this.rightTitle,
    @required this.rightSubtitle,
    @required this.rightIcon,

  });

  final String rightTitle;
  final String rightSubtitle;
  final String rightIcon;
  final String leftTitle;
  final String leftSubtitle;
  final String leftIcon;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InfoItem(title: leftTitle, subtitle: leftSubtitle, icon: leftIcon,isRight:false,),
        InfoItem(title: rightTitle, subtitle: rightSubtitle, icon: rightIcon,),
      ],
    );
  }
}

