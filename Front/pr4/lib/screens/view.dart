import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr4/database/memo.dart';
import 'package:pr4/database/db.dart';
import 'package:pr4/screens/edit.dart';
import 'package:pr4/screens/splash_screen.dart';

class ViewPage extends StatefulWidget {
  ViewPage ({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('images/back4.png'), // 배경 이미지
    ),
    ),
     child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions:<Widget> [
            IconButton(icon: const Icon(CupertinoIcons.delete),
              onPressed: showAlertDialog,
            ),
            IconButton(
              icon : const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(
                        builder: (context)=> EditPage(id: widget.id)));
              },
            ),
            IconButton(
              icon : const Icon(CupertinoIcons.graph_square),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(
                        builder: (context)=> SplashScreen()));
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: LoadBuilder()
        )),
    );
  }

  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }

  LoadBuilder(){
    return FutureBuilder<List<Memo>>(
      future: loadMemo(widget.id),
      builder: (BuildContext context,AsyncSnapshot<List<Memo>> snapshot){
        if (snapshot.data!.isEmpty){
          return Container(
              child: Text("데이터를 불러올 수 없습니다.")

          );
        } else{
          Memo memo = snapshot.data![0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [
              Container(height:70,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius:  BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top:10,left: 10,right: 10),
                  child: Text(memo.title, style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              Text("일기 작성 시간: "+memo.createTime.split('.')[0],
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.end,),
              Text("일기 수정 시간: "+memo.editTime.split('.')[0],
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.end,),
              Padding(padding: EdgeInsets.all(10)),
              Container(height: 400, child:SingleChildScrollView(padding: EdgeInsets.only(top: 10,left: 10,right: 10), child:Text(memo.text,style: TextStyle(fontWeight:FontWeight.w400, fontSize: 17),) ,),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
            ],
          );
        }
      },
    );
  }
  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog() async {
    await showDialog(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다."),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                deleteMemo(widget.id);
                Navigator.pop(_context);
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }
}



