import 'package:chat_app/helper/constants.dart';
import 'package:chat_app/helper/helperfunction.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/view/Conversation_screen.dart';
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
  DatabaseMethods databaseMethods = DatabaseMethods();
  Stream? chatRoomStream;

  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomStream,
        builder: (context,AsyncSnapshot<dynamic> snapshot){
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.size,
            itemBuilder: (context,index){
            return ChatRoomsTile(
                snapshot.data!.docs[index]["chatsroomid"]
                    .toString().replaceAll('_', "")
                    .replaceAll(Constants.myName, "").toUpperCase(),
                snapshot.data!.docs[index]["chatsroomid"]
            );
            }
        ): Container();
        },);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }
  getUserInfo() async{
    Constants.myName = (await HelperFunctions.getUserNameSharedPreference())!;
    //print("${Constants.myName}");

    databaseMethods.getChatRooms(Constants.myName).then((value){
      setState(() {
        chatRoomStream=value;
      });
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar:appBarMain1(context),
      body: chatRoomList(),
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
class ChatRoomsTile extends StatelessWidget {
  //const ChatRoomsTile({Key? key}) : super(key: key);
  final String userName;
  final String chatRoomId;
  ChatRoomsTile(this.userName,this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder:
        (context) => ConversationScreen(chatRoomId)
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                  Colors.lightBlue,
                  Colors.blue,
                  Colors.lightBlueAccent,
                  Colors.blue
                ]
            ),
            borderRadius: BorderRadius.circular(30)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child:Row(
          children: [
            SizedBox(width: 100,),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Text("${userName.substring(0,1).toUpperCase()}"),
            ),
            SizedBox(width: 20,),
            Text(userName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
      ),
    );
  }
}
