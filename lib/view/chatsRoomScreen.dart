import 'package:chat_app/services/auth.dart';
import 'package:chat_app/view/search.dart';
import 'package:chat_app/view/signin.dart';
import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}
class _ChatRoomState extends State<ChatRoom>{

  AuthMethods authMethods =new AuthMethods();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:appBarMain1(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => SearchScreen()
          ));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}