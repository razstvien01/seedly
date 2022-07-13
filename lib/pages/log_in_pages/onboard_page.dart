//* This .dart file is used for designing Onboarding page UI

import 'package:flutter/material.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/hdivider_text.dart';
class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          Row(
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
            'assets/images/icon.png', 
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
          RoundedGreenButton(text: 'Sign in', routeKey: '/onboard/login', onColor: true,),
          
          const HDividerText(),
          
          //* Sign up button
          RoundedGreenButton(text: 'Sign up', routeKey: '/onboard/signup', onColor: true,),
          
          const SizedBox(height: 50,),
          
          const Text('prototype version'),
        ],
      ),
    );
  }
}