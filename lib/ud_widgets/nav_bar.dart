import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.green[100],
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500
          )
        ),
      ),
      child: NavigationBar(
        selectedIndex: index,
        height: 60,
        backgroundColor: Colors.grey[100],
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home), label: 'Home',
          ),
          
          NavigationDestination(
            icon: Icon(Icons.shopping_cart), label: 'Cart',
            
          ),
          
          NavigationDestination(
            icon: Icon(Icons.messenger_rounded), label: 'Chat',
          ),
          
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined), label: 'Profile',
          ),
        ],
      ),
    );
  }
}