//* This .dart file is used for designing customize Rounded green button widget

import 'package:flutter/material.dart';

class RoundedGreenButton extends StatelessWidget {
  final String text;
  final String routeKey;
  final bool onColor;
  
  //* A constructor that accepts 3 data when it's being defined
  RoundedGreenButton({required this.text, required this.routeKey, required this.onColor});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.green[400] as Color;
    Color primary = Colors.white as Color;
    if(!onColor)
    {
      bgColor = Colors.grey[200] as Color;
      primary = Colors.grey[800] as Color;
    }
    return Container(
      width: 300,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: bgColor,
          primary: primary,
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