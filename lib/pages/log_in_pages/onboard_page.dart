//* This .dart file is used for designing Onboarding page UI

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/nav_bar.dart';
import 'package:seedly/models/plants.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/hdivider_text.dart';
class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return onboardUI();
    return Scaffold(
      body: authIfLoginOrNot()
    );
  }
  
  RoundedGreenButton clickSignup() => RoundedGreenButton(text: 'Sign up', routeKey: '/onboard/signup', onColor: true, onPressed: (){},);

  RoundedGreenButton clickSignin() => RoundedGreenButton(text: 'Sign in', routeKey: '/onboard/login', onColor: true, onPressed: (){});
  
  FutureBuilder<DocumentSnapshot?> dataLoad() {
    final user = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('users').doc(user?.uid);
    
    return FutureBuilder<DocumentSnapshot?>(
      future: docUser.get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          
          // print(data.);
          // for(Map values in data.values){
            
          // }
          
  //         for (var k in numMap.keys) {
  //   print("Key : $k, value : ${numMap[k]}");
  // }    
          // for(var k in data.keys){
          //   // print('Key: $k, value: ${data[k]}');
          //   if(k == 'favorite_plants'){
              
          //     for(Map v in data.values){
          //       print(v);
          //     }
              
          //   }
          // }
          // var list = [];
          
          // list.add(data);
          
          // // print(list[0]['favorite_plants']);
          // for(List l in list){
          //   print(l['favorite_plants']);
          // }
          
          data.forEach((key, value) {
            if(key == 'favorite_plants'){
              Map v = data[key];
              v.forEach((k, v) {
                // print('key: ${k}, value: ${v}');
                Plant.plantList[int.parse(k)].isFavorated = v;
              });
            }
          });
          
          data.forEach((key, value) {
            if(key == 'cart_plants'){
              Map v = data[key];
              v.forEach((k, v) {
                // print('key: ${k}, value: ${v}');
                Plant.plantList[int.parse(k)].isSelected = v;
              });
            }
          });
          return NavBar();
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
  
  StreamBuilder<User?> authIfLoginOrNot() {
    return StreamBuilder<User?>(
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
          print('AUTO SIGN IN');
          return dataLoad();
        }
        else{
          print('no data');
          return onboardUI();
        }
      },
    );
  }

  Scaffold onboardUI() {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          
          
          const SizedBox(height: 20,),
          
          //* Seedly icon
          Image.asset(
            'assets/icons/icon.png', 
            height: 200, 
            width:  200,
          ),
          
          
          Text(
            'Seedly',
            style: TextStyle(
              fontSize: 50,
              color: Colors.green[400],
              fontWeight: FontWeight.bold,
            )
          ),
          
          const SizedBox(height: 50,),
          
          //* Login/Sign button
          clickSignin(),
          
          const HDividerText(),
          
          //* Sign up button
          clickSignup(),
          
          const SizedBox(height: 50,),
          
          const Text('prototype version'),
        ],
      ),
    ),
  );
  }
}