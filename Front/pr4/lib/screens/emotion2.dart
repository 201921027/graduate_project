import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr4/screens/home.dart';

class EmotionPage2 extends StatelessWidget {
  //const EmotionPage2({Key? key}) : super(key: key); id

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/back1.png'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(child: Image.asset("images/Union.png")),
              Padding(padding: EdgeInsets.all(5)),
              Container(

                  child: Text(
                    '저장되었습니다. \n보관함에서 확인해보세요!',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,fontFamily: 'Dongle',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )),
              Padding(padding: EdgeInsets.all(80)),
              SizedBox(
                  width: 300,
                  height: 70,
                  child: FittedBox(
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.deepOrangeAccent[100],
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => MyHomePage(
                                      title: '',
                                    )));
                      },
                      tooltip: '보관함으로 이동하려면 눌러주세요',
                      label: Text('보관함으로 가기'),
                      icon: Icon(CupertinoIcons.tray_2),
                    ),
                  ))
            ]),
        ),
      ),
    );
  }
}
