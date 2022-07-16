//* This .dart file is used for designing Log in page UI

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/main.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/ud_widgets/nav_bar.dart';

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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(), );
      
      Navigator.of(context)
    .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    
    //* Navigator.of(context) not working!
  }
  
  @override
  Widget build(BuildContext context) {
    // return loginUI();
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            print('hmmmmm');
            return Center(child: Text('Something went wrong!'));
          }
          else if(snapshot.hasData){
            return NavBar();
          }
          else{
            print('no data');
            return loginUI();
          }
        },
      )
    );
  }

  Scaffold loginUI() {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text(
        'Log In to your Account',
        style: TextStyle(color: Colors.black),
      ),
      
    ),
    
    body: SingleChildScrollView(
      child: Center(
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
              routeKey: '/navbar',
              text: 'Log in',
              onColor: true,
              onPressed: signIn,
            ),
            
            const SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '/asdsaddsds',
              text: 'Forgot account',
              onColor: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  );
  }
}
