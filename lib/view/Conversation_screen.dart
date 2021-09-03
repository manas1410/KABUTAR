import 'package:chat_app/helper/constants.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  //const ConversationScreen({Key? key}) : super(key: key);
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messageController = new TextEditingController();

  Stream? chatMessageStream;
  //QuerySnapshot? snapshot;

  Widget ChatMessageList(){
  return StreamBuilder(
    stream: chatMessageStream,
    builder: (context,snapshot){
      return ListView.builder(
          itemCount:snapshot.data!.length,
          itemBuilder: (context,index){
            return 
          });
    },
  );
  }
  sendMessage(){
    if (messageController.text.isNotEmpty){
      Map<String,String> messageMap = {
        "message": messageController.text,
        "sendBy" : Constants.myName,
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
    }
  }

  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value){
      setState(() {
        chatMessageStream =value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
      appBar: appBarMain2(context),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                              hintText: "Message...",
                              hintStyle: TextStyle(
                                  color: Colors.black54
                              ),
                              border: InputBorder.none
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        sendMessage();
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
                          child: Icon(Icons.send,size: 25,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageTile extends StatelessWidget {
  const MessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
