//* This .dart file is used for designing Cart page UI in main menu folder

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart', style: TextStyle(fontSize: 72),),);
  }
}