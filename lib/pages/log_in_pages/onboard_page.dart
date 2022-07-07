import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

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
          
          SizedBox(height: 20,),
          
          RoundedGreenButton(text: "Log in", routeKey: '/login', onColor: true,),
          
          Row(
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey[600],
                ),
              ),
              
              Text('or'),
              
              Expanded(
                child: Divider(
                  color: Colors.grey[600],                ),
              ),
            ],
          ),
          
          RoundedGreenButton(text: 'Sign up', routeKey: '/signup', onColor: true,),
        ],
      ),
    );
  }
}
