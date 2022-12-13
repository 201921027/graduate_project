import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr4/screens/main_home.dart';
import 'package:pr4/screens/home.dart';
import 'package:pr4/screens/write.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/percent_indicator.dart';


class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  State<reportPage> createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
  //double progressValue = 70;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/back1.png'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Center(
                child: Container(
                    child: Image.asset("images/Union.png"),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0x80FFFA76),
                    )),
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text('      ',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffFF9933),
                            fontWeight: FontWeight.w500)),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)))),
                flex: 1),
            Expanded(
                child: Container(
                  //흰박스
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,

                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("이번 주 TOP 3 감정",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Color(0xffFA8B55),fontFamily: 'Dongle'),textAlign: TextAlign.start,),
                        Container(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(child:getFilledTrackStyle(53)),
                              Expanded(child:getFilledTrackStyle(29)),
                              Expanded(child:getFilledTrackStyle(13)),
                            ]
                          )
                        ),
                         Container(
                            child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("기쁨",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'Dongle',color: Color(0xffFA8B55))),
                                  Padding(padding: EdgeInsets.only(right:85)),
                                  Text("슬픔",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'Dongle',color: Color(0xffCCCCCC))),
                                  Padding(padding: EdgeInsets.only(left:85)),
                                  Text("두려움",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'Dongle',color: Color(0xffCCCCCC))),
                                ]
                            )
                        ),

                        Text("지난 한달 동안 감정 요약",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Color(0xffFA8B55),fontFamily: 'Dongle'),),
                         Container(
                          child: Expanded(child:Row(
                            children: [
                              Padding(padding: EdgeInsets.only(top:0) ,
                              child: Column(
                                children: [
                                  Text("기쁨",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Dongle',color: Color(0xff999999))),
                                  Text("슬픔",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Dongle',color: Color(0xff999999))),
                                  Text("두려움",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Dongle',color: Color(0xff999999))),
                                  Text("분노",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Dongle',color: Color(0xff999999))),
                                ],
                              ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    new LinearPercentIndicator(
                                      width: 260.0,
                                      lineHeight: 15.0,
                                      percent: 0.53,
                                      progressColor: Colors.blue,
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 10)),
                                    new LinearPercentIndicator(
                                      width: 260.0,
                                      lineHeight: 15.0,
                                      percent: 0.29,
                                      progressColor: Colors.orange,
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 10)),
                                    new LinearPercentIndicator(
                                      width: 260.0,
                                      lineHeight: 15.0,
                                      percent: 0.13,
                                      progressColor: Colors.red,
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 10)),
                                    new LinearPercentIndicator(
                                      width: 260.0,
                                      lineHeight: 15.0,
                                      percent: 0.05,
                                      progressColor: Colors.red,
                                    )
                                  ],
                                ),
                              ),

                            ],
                          )
                          )
                        )




                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                    )),
                flex: 9)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xffCCCCCC),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Expanded(child: new Text('')),
              Expanded(
                child: IconButton(
                    icon: Icon(
                      CupertinoIcons.home,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => MainHome()));
                    }),
              ),
              Expanded(
                child: IconButton(
                    icon: Icon(
                      CupertinoIcons.doc_chart,
                      size: 28,
                    ),
                    onPressed: () {Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => reportPage()));}),
              ),
              Expanded(
                child: IconButton(
                    icon: Icon(
                      CupertinoIcons.tray_2,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => MyHomePage(
                                title: '',
                              )));
                    }),
              ),
              Expanded(
                child: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 28,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 36,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => WritePage()));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );

  }
  Widget getFilledTrackStyle(double progressValue) {
    return Container(
        height: 110,
        width: 110,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 1,
                color: const Color(0xffFFECA7),
                    //.fromARGB(255, 255, 204, 204),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: progressValue,
                  width: 0.15,
                  enableAnimation: true,
                  animationDuration: 100,
                  color: Colors.white,
                  pointerOffset: 0.1,
                  cornerStyle: CornerStyle.bothCurve,
                  animationType: AnimationType.linear,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.5,
                    widget: Text(progressValue.toStringAsFixed(0) + '%',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize:17 )))
              ])
        ]));
  }



}
