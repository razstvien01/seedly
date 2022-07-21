//* This .dart file is used for designing Onboarding page UI

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/nav_bar.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/hdivider_text.dart';
class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return onboardUI();
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
            return onboardUI();
          }
        },
      )
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
          RoundedGreenButton(text: 'Sign in', routeKey: '/onboard/login', onColor: true, onPressed: (){}),
          
          const HDividerText(),
          
          //* Sign up button
          RoundedGreenButton(text: 'Sign up', routeKey: '/onboard/signup', onColor: true, onPressed: (){},),
          
          const SizedBox(height: 50,),
          
          const Text('prototype version'),
        ],
      ),
    ),
  );
  }
}