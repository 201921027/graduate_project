import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'emotion.dart';


class SplashScreen extends StatefulWidget {
  // final String id;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('images/back1.png'), // 배경 이미지
    ),
    ),
      child :Scaffold(
          backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Expanded( child: Image.asset("images/Union.png"),),
              Container(child: Image.asset("images/Union.png"),
              ),
              Padding(padding: EdgeInsets.all(15)),
              Text('감정분석 중',style: TextStyle(fontSize:50,fontFamily: 'Dongle',fontWeight: FontWeight.w500,color: Colors.black)),
              Padding(padding: EdgeInsets.all(10)),
              SpinKitFadingCircle(color: Colors.white70,size: 80.0,)
            ],
          ),
        )
    ),
    );
  }
  @override
  void initState() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => EmotionPage()
      )
      );
    });
  }
}
