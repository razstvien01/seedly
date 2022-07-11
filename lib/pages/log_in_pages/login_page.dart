import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/textfieldcontainer.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';
import 'package:seedly/ud_widgets/cbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log In to your Account',
          style: TextStyle(color: Colors.black),
        ),
        
      ),
      
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            const SizedBox(height: 200,),
            
            const TextFieldContainer(hintText: 'Username'),
            
            const SizedBox(height: 20,),
            
            const TextFieldContainer(hintText: 'Password',),
            
            const SizedBox(height: 20,),
            
            const CBox(),
            
            const SizedBox(height: 20,),
            
            RoundedGreenButton(
              routeKey: '/onboard/login/home',
              text: 'Log in',
              onColor: true,
            ),
            
            const SizedBox(height: 20,),
            
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
