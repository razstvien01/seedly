//* This .dart file is used for designing Sign up page UI

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/main.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    
    super.dispose();
  }

  Future signUp() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      print('account created');
      Navigator.of(context)
    .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      return;
    } on FirebaseAuthException catch(e){
      print(e);
    }
    
  }

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
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  TextFieldContainer(hintText: 'Email', textEditingController: emailController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  TextFieldContainer(hintText: 'Password', textEditingController: passwordController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  RoundedGreenButton(onColor: true, routeKey: '/onboard', text: 'Sign Up', onPressed: signUp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}