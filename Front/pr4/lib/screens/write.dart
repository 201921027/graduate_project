import 'package:flutter/material.dart';
import 'package:pr4/database/memo.dart';
import 'package:pr4/database/db.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class WritePage extends StatelessWidget {
  String title = '';
  String text = '';
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: saveDB,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(child:Text('    Title',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius:  BorderRadius.circular(28),
                  ),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:TextField(
                  maxLines: 2,
                  onChanged: (String title) {
                    this.title = title;
                  },
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //obscureText: true,
                  decoration: InputDecoration(
                    //filled: true,
                    //fillColor: Colors.white38,
                    //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: new BorderRadius.circular(25.7),),
                    hintText: '일기의 제목을 적어주세요.',
                  ),
                ),),
                Padding(padding: EdgeInsets.all(10)),
                Container(child:Text('    Contents',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius:  BorderRadius.circular(28),
                  ),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:TextField(
                  maxLines: 18,
                  onChanged: (String text) {
                    this.text = text;
                  },
                  //obscureText: true,
                  decoration: InputDecoration(
                    //filled: true,
                    //fillColor: Colors.white38,
                    //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white38),borderRadius: new BorderRadius.circular(25.7),),
                    hintText: '일기의 내용을 적어주세요.',
                  ),
                ),),
              ],
            ),
          )),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: str2Sha512(DateTime.now().toString()), // String
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
    Navigator.pop(_context);
  }

  String str2Sha512(String text) {
    var bytes = utf8.encode(text); // data being hashed
    var digest = sha512.convert(bytes);
    return digest.toString();
  }
}
