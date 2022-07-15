//* This .dart file is used for designing customize TextField widget

import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  
  const TextFieldContainer({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.textInputAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: TextField(
        controller: textEditingController,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}