import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/cbox.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log In to your Account'),
      ),
      
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            SizedBox(height: 200,),
            
            TextFieldContainer(hintText: 'Username'),
            
            SizedBox(height: 20,),
            
            TextFieldContainer(hintText: 'Password',),
            
            SizedBox(height: 20,),
            
            CBox(),
            
            SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '',
              text: 'Log in',
              onColor: true,
            ),
            
            SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '',
              text: 'Forgot account',
              onColor: false,
            ),
          ],
        ),
      ),
    );
  }
}
