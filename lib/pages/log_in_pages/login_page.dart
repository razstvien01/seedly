import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/textfieldcontainer.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log In to your Account'),
      ),
      
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20,),
          Text('username'),
          TextFieldContainer(child: TextField(),),
          
        ],
      ),
    );
  }
}
