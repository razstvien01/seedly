import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class Signup_Page extends StatelessWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create New Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                TextFieldContainer(hintText: 'Username'),
                TextFieldContainer(hintText: 'Password'),
                TextFieldContainer(hintText: 'Email'),
                RoundedGreenButton(onColor: true, routeKey: '', text: 'Continue'),
              ],
            ),
          )
        ],
      ),
    );
  }
}