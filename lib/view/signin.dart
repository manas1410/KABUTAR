import 'package:chat_app/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 300,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                //SizedBox(height:50,),
                TextField(
                  style: simpleTextFieldStyle(),
                  decoration: textFieldInputDecoration("Email"),
                ),
                SizedBox(height: 8,),
                TextField(
                  style: simpleTextFieldStyle(),
                  decoration: textFieldInputDecoration("Password"),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  child:Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text(
                      "Forget Password?",
                      style: mediumTextFieldStyle(),
                    ),
                  )
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff997FF4),
                        const Color(0xff2A75BC)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Sign In",style: TextStyle(
                    fontSize: 23,
                  )
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF0000),
                          const Color(0xFFFF9000),
                          const Color(0xFF009000),
                          Colors.blue,
                        ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Sign In with Google",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  )
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account? ",style: mediumTextFieldStyle(),),
                    Text("Register Now ",style: TextStyle(
                      fontSize: 17,
                        decoration: TextDecoration.underline,
                    ),
                    ),

                  ],
                ),
                SizedBox(height: 110,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
