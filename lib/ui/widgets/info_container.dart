import 'package:devida/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({
    @required this.icon,@required this.subtitle,this.data=null,this.notes=null,this.isNote=false,this.onTap, this.isCase=false
  }) ;

  final String icon;
  final String subtitle;
  final List data;
  final String notes;
  final bool isNote;
  final bool isCase;
  final Function onTap;

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  bool cardExpand;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardExpand = false;
  }
  @override
  Widget build(BuildContext context) {
    ScreenHelper screenSize = ScreenHelper(context);
    return Padding(
      padding:  EdgeInsets.only(left:screenSize.screenWidth(8.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: screenSize.screenWidth(12.5),
            backgroundImage: AssetImage(widget.icon),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: screenSize.screenWidth(5.0),),


            Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(

                width: screenSize.screenWidth(280.0),
                //================Hight Of Outer Container===============================
                height: cardExpand ? (widget.isNote ? screenSize.screenHight(110.0): screenSize.screenHight(150.0)) : screenSize.screenHight(30.0),
                child: Column(
                  children: <Widget>[

                    //================Start Data Area=================
                    Padding(
                      padding: EdgeInsets.only(
                        left : screenSize.screenWidth(10.0),
                        right : screenSize.screenWidth(10.0),
                        top: screenSize.screenHight(5.0),
                      ),
                      child: Container(
                        //color: Colors.red,
                        width: screenSize.screenWidth(280.0),
                        //================Hight Of Inner Container===============================
                        height: cardExpand ? (widget.isNote ? screenSize.screenHight(80.0): screenSize.screenHight(120.0)) : screenSize.screenHight(3.0),
                        //===============Put Your Data===========================================
                        child: filledContainer(screensize: screenSize),
                      ),
                    ),
                    //===============End Data Area=========================

                    SizedBox(height: screenSize.screenHight(3.0)),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            cardExpand = !cardExpand;
                          });
                          print(cardExpand);
                        },
                    child:Padding(
                      padding:  EdgeInsets.only(left:screenSize.screenWidth(10.0),right: screenSize.screenWidth(8.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.subtitle,style: TextStyle(fontSize: 7.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),),

                          Icon(
                              Icons.arrow_drop_down,
                              size: 15.0,
                              color: Color(0xff1749A2)),
                        ],
                      ),
                    )
                   )
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }

  Widget filledContainer({ScreenHelper screensize}){
    if(cardExpand){
      if(widget.isNote){
        if(widget.notes==null){
          return Text('there is no data');
        }else{
          return Text(widget.notes,style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w600,fontFamily: 'bahnschrift'),);
        }
      }else{
        if(widget.data==null){
          return Text('there is no data');
        }else{
          return ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context,index)=>Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    widget.onTap(widget.data[index].id);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: screensize.screenWidth(13.0),
                        width: screensize.screenWidth(13.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(screensize.screenWidth(7.5))),
                          border: Border.all(color: Color(0xff1749A2),width: 1.0),
                        ),
                        child: Center(child: Text(index.toString(),style: TextStyle(fontSize: 10.0,color: Color(0xff1749A2),fontWeight: FontWeight.w800,fontFamily: 'bahnschrift'),)),
                      ),
                      SizedBox(width: screensize.screenWidth(4.0),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          widget.isCase?
                      Text('Entry Date Is ${widget.data[index].entry_date}',style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w800,fontFamily: 'bahnschrift'),)
                              :
                      Text(widget.data[index].name,style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w800,fontFamily: 'bahnschrift'),),

                          SizedBox(height: screensize.screenWidth(2.0),),
                          widget.isCase?
                          Text('Number Of Diagnoses Is ${widget.data[index].diagnoses.length}',style: TextStyle(fontSize: 11.0,color: Color(0xff1749A2),fontWeight: FontWeight.w800,fontFamily: 'bahnschrift'),)
                              :
                          Container(
                            color: Colors.transparent,
                            height: screensize.screenWidth(20.0),
                            width: screensize.screenWidth(240.0),
                            child: Text(widget.data[index].content,
                              style: TextStyle(fontSize: 6.0,color: Color(0xffA2A2A2),fontWeight: FontWeight.w800,fontFamily: 'bahnschrift'),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: screensize.screenHight(3.0),)
              ],
            ),
          );
        }
      }
    }else{
      return null;
    }
  }
}
