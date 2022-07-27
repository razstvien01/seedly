//* This .dart file is used for designing Sign up page UI

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/models/plants.dart';
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
    final currentUser = FirebaseAuth.instance.currentUser;
    
    final user = UserDetails(
        name: nameController.text,
        address: addressController.text,
        email: emailController.text,
        contact_number: int.parse(contactController.text)
      );
    
    final docUser = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
    
    final json = user.toJson();
    
    await docUser.set(json);
    // await docUser.update({
    //     'map1': {
    //     'key1': 'value1',
    //     'key2': 'value2',
    //     }
    // });
    
    Map<String, Map<String, dynamic>> plantFav = {
      'favorite_plants': {}
    };
    
    for(int i = 0; i < Plant.plantList.length; ++i){
      for(Map value in plantFav.values){
        value['$i'] = Plant.plantList[i].isFavorated;
      }
    }
    
    Map<String, Map<String, dynamic>> plantCart = {
      'cart_plants': {}
    };
    
    for(int i = 0; i < Plant.plantList.length; ++i){
      for(Map value in plantCart.values){
        value['$i'] = Plant.plantList[i].isSelected;
      }
    }
    
    await docUser.update(plantFav);
    await docUser.update(plantCart);
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