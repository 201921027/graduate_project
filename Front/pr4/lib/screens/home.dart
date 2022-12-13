import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'write.dart';
import 'package:pr4/database/memo.dart';
import 'package:pr4/database/db.dart';
import 'package:pr4/screens/view.dart';
import 'package:pr4/screens/main_home.dart';
import 'package:pr4/screens/report.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';

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
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 80),
              child: Container(),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text('My Diary',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xffFF9933),
                            fontWeight: FontWeight.w700)),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)))),
                flex: 2),
            Expanded(
                child: Container(
                    child: memoBuilder(context),
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
              Expanded(child:IconButton(icon: Icon(CupertinoIcons.home,size: 28,), onPressed: () {Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MainHome()));}),),
              Expanded(child:IconButton(icon: Icon(CupertinoIcons.doc_chart,size: 28,), onPressed: () {Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => reportPage()));}),),
              Expanded(child:IconButton(icon: Icon(CupertinoIcons.tray_2,size: 28,), onPressed: () { Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MyHomePage(title: '',)));}),),
              Expanded(child:IconButton(icon: Icon(Icons.more_vert,size: 28,), onPressed: () {}),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,size:36 ,),
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

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제경고'),
          content: Text("정말 삭제하시겠습니까?\n삭제한 일기는 복구되지 않습니다."),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                });
                deleteId = '';
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                deleteId = '';
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }

  Widget memoBuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if ((projectSnap.data as List).length == 0) {
          return Container(
              alignment: Alignment.center,
              child: Text(
                '지금 바로 "일기 추가" 버튼을 눌러 \n새로운 일기를 추가해보세요!\n\n\n\n\n\n\n',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ));
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: (projectSnap.data as List).length,
          itemBuilder: (context, index) {
            Memo memo = (projectSnap.data as List)[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    parentContext,
                    CupertinoPageRoute(
                        builder: (context) => ViewPage(id: memo.id)));
              },
              onLongPress: () {
                deleteId = memo.id;
                showAlertDialog(parentContext);
              },
              child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            memo.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          Text(
                            memo.text,
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "최종 수정 시간: " + memo.editTime.split('.')[0],
                            style: TextStyle(fontSize: 11),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      )
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
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
