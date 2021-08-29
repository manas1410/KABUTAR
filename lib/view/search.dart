import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen>{

  TextEditingController searchTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBarMain1(context),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        decoration: InputDecoration(
                            hintText: "Search username...",
                          hintStyle: TextStyle(
                              color: Colors.black54
                          ),
                            border: InputBorder.none
                        ),
                      )
                  ),
                  Container(
                    //height: 40,
                      //width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.blue,
                          Colors.lightBlueAccent,
                          Colors.blue,
                          Colors.blue
                        ]
                      ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.search,size: 40,)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}