//* This .dart file is used for designing Sign up page UI

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/models/user.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
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
      
      createUser();
      
      Navigator.of(context)
    .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      return;
    } on FirebaseAuthException catch(e){
      print(e);
    }
    
  }
  
  Future createUser() async{
    final user = UserDetails(
        name: nameController.text,
        address: addressController.text,
        email: emailController.text,
        contact_number: int.parse(contactController.text)
      );
    
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.email);
    
    final json = user.toJson();
    
    await docUser.set(json);
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
                  TextFieldContainer(hintText: 'Name', textEditingController: nameController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  TextFieldContainer(hintText: 'Address', textEditingController: addressController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  TextFieldContainer(hintText: 'Contact Number', textEditingController: contactController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  TextFieldContainer(hintText: 'Email', textEditingController: emailController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  TextFieldContainer(hintText: 'Password', textEditingController: passwordController, textInputAction: TextInputAction.next),
                  SizedBox(height: 30,),
                  
                  createAccount(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RoundedGreenButton createAccount() => RoundedGreenButton(onColor: true, routeKey: '/onboard', text: 'Sign Up', onPressed: signUp);
}