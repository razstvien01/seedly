import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

//* This .dart file is used for designing Loading screen page UI in main menu folder

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //* a method for delaying a loading screen and it will push to another route
  void doDelay() async{
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboard');
    });
    
  }
  
  @override
  void initState(){
    doDelay();
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