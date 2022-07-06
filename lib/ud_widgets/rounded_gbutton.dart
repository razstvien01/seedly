import 'package:flutter/material.dart';

class RoundedGreenButton extends StatelessWidget {
  final String text;
  
  RoundedGreenButton({required this.text});

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
        onPressed: () {},
        
        child: Text(
          text,
          style: TextStyle(fontSize: 14)
        ),
      ),
    );
  }
}