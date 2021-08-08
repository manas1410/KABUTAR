import 'package:chat_app/services/auth.dart';
import 'package:chat_app/view/signin.dart';
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
      appBar:AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff2A75BC),
        title: Image.asset("assets/images/chat_app_logo.png",
          height: 60,width: 9999,
          alignment: Alignment.centerLeft,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: (){
                authMethods.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => SignIn()));
              },
              child: Icon(
                  Icons.exit_to_app,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}