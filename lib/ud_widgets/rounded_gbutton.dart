import 'package:flutter/material.dart';

class RoundedGreenButton extends StatelessWidget {
  final String text;
  final String routeKey;
  
  RoundedGreenButton({required this.text, required this.routeKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.green[400],
          primary: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeKey);
        },
        
        child: Text(
          text,
          style: TextStyle(fontSize: 14)
        ),
      ),
    );
  }
}