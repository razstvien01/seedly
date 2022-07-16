//* This .dart file is used for designing Profile page UI in main menu folder

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Signed In as',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                
                SizedBox(height: 8,),
                
                Text(
                  '${user?.email}',
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(height: 40,),
                
                RoundedGreenButton(
                  onColor: true,
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  },
                  routeKey: '/signout',
                  text: 'Sign Out',
                ),
                
              ],
            ),
          ),
      ),
    );
  }
}