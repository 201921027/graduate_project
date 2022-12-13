import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'write.dart';
import 'package:pr4/screens/home.dart';
import 'package:pr4/screens/report.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final _calendarControllerToday = AdvancedCalendarController.today();
  final List<DateTime> events = [
    //일기 작성일
    DateTime.utc(2022, 11, 2, 12),
    DateTime.utc(2022, 11, 4, 12),
    DateTime.utc(2022, 11, 10, 12),
    DateTime.utc(2022, 11, 12, 12),
  ];
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
              padding: EdgeInsets.only(top: 40, bottom: 60),
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
                            fontSize: 30,
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
                      top: 15,
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      children: [
                        Container(
                            //안에 핑크박스
                            child: Column(
                              //calendar
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AdvancedCalendar(
                                  controller: _calendarControllerToday,
                                  events: events,
                                  startWeekDay: 1,
                                ),
                                Text("  \u{1F535} :일기를 작성한 날 ",style: TextStyle(color: Colors.blue,fontSize: 20,fontFamily: 'Dongle',fontWeight: FontWeight.w600),)
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffFFECA7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(0, 10),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            )),
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
}
