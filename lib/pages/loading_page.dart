import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

//* This .dart file is used for designing Loading screen page UI in main menu folder

class LoadingPage extends StatefulWidget {
  LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  static bool start = true;
  //* a method for delaying a loading screen and it will push to another route
  void doDelay(String routeKey) async{
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, routeKey);
    });
    
  }
  
  @override
  void initState(){
    String routeKey = (start) ? '/onboard' : '/navbar';
    
    start = false;
    doDelay(routeKey);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: SpinKitFoldingCube(
          color: Colors.green[300],
          size: 50.0,
          
        ),
      )
    );
  }
}