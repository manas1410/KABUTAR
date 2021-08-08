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