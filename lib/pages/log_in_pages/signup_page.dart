//* This .dart file is used for designing Sign up page UI

import 'package:flutter/material.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create New Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                TextFieldContainer(hintText: 'Username', textEditingController: TextEditingController(), textInputAction: TextInputAction.next),
                SizedBox(height: 30,),
                TextFieldContainer(hintText: 'Password', textEditingController: TextEditingController(), textInputAction: TextInputAction.next),
                SizedBox(height: 30,),
                TextFieldContainer(hintText: 'Email', textEditingController: TextEditingController(), textInputAction: TextInputAction.next),
                SizedBox(height: 30,),
                RoundedGreenButton(onColor: true, routeKey: '', text: 'Continue', replace: false,),
              ],
            ),
          )
        ],
      ),
    );
  }
}