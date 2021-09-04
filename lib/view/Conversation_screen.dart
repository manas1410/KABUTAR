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
    builder: (context, AsyncSnapshot<dynamic> snapshot){
      if (snapshot.hasData) {
        //print(chatMessageStream);
        return ListView.builder(
            itemCount: snapshot.data.size,
            itemBuilder: (context, index) {
              return MessageTile(
                  snapshot.data!.docs[index]["message"],
                  snapshot.data!.docs[index]["sendBy"] == Constants.myName
              );
            });
      }
      else{
        print("chatMessageStream");
        print(chatMessageStream);
        return Container();
      }
    },
  );
  }
  sendMessage(){
    if (messageController.text.isNotEmpty){
      Map<String,dynamic> messageMap = {
        "message": messageController.text,
        "sendBy" : Constants.myName,
        "time" : DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text ="";
    }
  }

  @override
  void initState() {
    //print("haha"+ widget.chatRoomId);
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
            ChatMessageList(),
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
  //const MessageTile({Key? key}) : super(key: key);
  final String message;
  final bool isSendByMe;
  MessageTile(this.message,this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: isSendByMe ? 0:24 ,
          right: isSendByMe ? 24:0),
      margin: EdgeInsets.symmetric(vertical: 4),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe?
            [
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
            ]:[
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
              ]
          ),
          borderRadius: isSendByMe?
          BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomLeft: Radius.circular(23)
          ):
          BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23)
          )

        ),
        child:Text(message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          )),
      ),
    );
  }
}
