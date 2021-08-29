import 'package:chat_app/services/auth.dart';
import 'package:chat_app/view/signin.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarMain(BuildContext context){
  return AppBar(
    toolbarHeight: 250,
    backgroundColor: Color(0xff2A75BC),
    title: Image.asset("assets/images/chat_app_logo.png",height: 60,width: 9999,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(1000),
      ),
    ),
  );
}
PreferredSizeWidget appBarMain1(BuildContext context){
  AuthMethods authMethods =new AuthMethods();
  return AppBar(
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
  );
}

InputDecoration textFieldInputDecoration(String xtext){
  return InputDecoration(
    hintText: xtext,
    border: OutlineInputBorder(),
  );
}

TextStyle simpleTextFieldStyle(){
  return TextStyle(
    fontSize: 16,
  );
}

TextStyle mediumTextFieldStyle(){
  return TextStyle(
    fontSize: 17,
  );
}