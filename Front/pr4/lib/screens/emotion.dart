import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'emotion2.dart';

class EmotionPage extends StatelessWidget {
  //const EmotionPage({Key? key, required this.id}) : super(key: key);
  //final String id;                 여기에 데이터 고유아이디로 데이터 불러오면됨
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 80, bottom: 20),
            ),
            // Container(
            //     margin: EdgeInsets.only(left: 5, top: 20, right: 5),
            //     padding: EdgeInsets.all(15),
            //     alignment: Alignment.center,
            //     height: 100,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.stretch,
            //           children: <Widget>[
            //             Text(
            //               '제목',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //               overflow: TextOverflow.clip,
            //             ),
            //             Text(
            //               '내용',
            //               style: TextStyle(fontSize: 15),
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //           ],
            //         ),
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.stretch,
            //           children: [
            //             Text(
            //               "일기 작성 시간: ",
            //               style: TextStyle(fontSize: 11),
            //               textAlign: TextAlign.end,
            //             ),
            //           ],
            //         )
            //       ],
            //     ),
            //     decoration: BoxDecoration(
            //       color: Color(0xffFFCC99),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.7),
            //           spreadRadius: 0,
            //           blurRadius: 2,
            //           offset: Offset(0, 10),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(12),
            //     )),
            Padding(padding: EdgeInsets.only(top: 20, bottom: 50)),
            Text('Result',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '기쁨',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          '무기력과 무관심이 나의 일부분이라고 생각해왔던 20여년의 세월과는 달리 작년의 2019년은 유독 무기력과 무관심이 나를 갉아먹었던 시간이었군요. 새로운 환경과 관계에 도전해보고 싶었던 당신은 분명 잘 해낼 수 있을 것이라고 믿어요. ',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffFFCC99),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 10),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                )),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
                width: 250,
                height: 60,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.deepOrangeAccent[100],
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => EmotionPage2()));
                    },
                    tooltip: '감정을 저장하려면 눌러주세요',
                    label: Text('저장'),
                    icon: Icon(Icons.save),
                  ),
                ))
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     Navigator.push(
        //         context, CupertinoPageRoute(builder: (context) => EmotionPage2()));
        //
        //   },
        //   tooltip: '감정을 저장하려면 눌러주세요',
        //   label: Text('저장'),
        //   icon: Icon(Icons.save),
        // ),
      ),
    );
  }
}
