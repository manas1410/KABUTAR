import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBarMain1(context),
    );
  }
}