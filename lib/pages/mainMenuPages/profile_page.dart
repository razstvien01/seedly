//* This .dart file is used for designing Profile page UI in main menu folder

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile', style: TextStyle(fontSize: 72),),);
  }
}