import 'package:chat_app/services/database.dart';
import 'package:chat_app/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen>{

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot? searchSnapshot;
  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text)
        .then((val){
          setState(() {
            searchSnapshot = val;
          });
    }
    );
  }

  /*createChatroomAndStartConversation(String username){
    List<String> users = [username,];
    databaseMethods.createChatRoom(chatRoomId, chatRoomMap)
  }*/

  Widget searchList(){
    return searchSnapshot!=null ?ListView.builder(
      itemCount: searchSnapshot!.docs.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
        return SearchTile(
            userName: searchSnapshot!.docs[index]['name'],
            userEmail: searchSnapshot!.docs[index]['email']
        );
        }
    ):Container();
  }

  @override
  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlue,
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
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            searchList()
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget{

  final String userName;
  final String userEmail;
  SearchTile({required this.userName,required this.userEmail});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30)
        ),
      child:Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style: mediumTextFieldStyle()),
              SizedBox(height: 4,),
              Text(userEmail,style: mediumTextFieldStyle())
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Text("Message",style: mediumTextFieldStyle()),
            ),
          )
        ],
      )
    );
  }
}