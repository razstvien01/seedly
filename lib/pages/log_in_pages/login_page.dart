//* This .dart file is used for designing Log in page UI

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/cbox.dart';

class LoginPage extends StatefulWidget {
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    
    super.dispose();
  }
  
  //* Email and password authentification
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log In to your Account',
          style: TextStyle(color: Colors.black),
        ),
        
      ),
      
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,),
            
            TextFieldContainer(hintText: 'Username', textEditingController: emailController, textInputAction: TextInputAction.next),
            
            const SizedBox(height: 20,),
            
            TextFieldContainer(hintText: 'Password', textEditingController: passwordController, textInputAction: TextInputAction.done),
            
            const SizedBox(height: 20,),
            
            const CBox(),
            
            const SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '/',
              text: 'Log in',
              onColor: true,
              replace: true,
            ),
            
            const SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '',
              text: 'Forgot account',
              onColor: false,
              replace: false,
            ),
          ],
        ),
      ),
    );
  }
}
