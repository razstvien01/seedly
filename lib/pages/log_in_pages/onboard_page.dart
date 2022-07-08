import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/hdivider_text.dart';
class Onboard_Page extends StatelessWidget {
  const Onboard_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          
          
          SizedBox(height: 20,),
          
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
          
          SizedBox(height: 50,),
          
          RoundedGreenButton(text: "Log in", routeKey: '/onboard/login', onColor: true,),
          
          HDividerText(),
          
          RoundedGreenButton(text: 'Sign up', routeKey: '/onboard/signup', onColor: true,),
          
          SizedBox(height: 50,),
          
          Text('prototype version'),
        ],
      ),
    );
  }
}