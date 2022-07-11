import 'package:flutter/material.dart';
import 'package:seedly/pages/mainMenuPages/home.dart';
import 'package:seedly/pages/mainMenuPages/cart_page.dart';
import 'package:seedly/pages/mainMenuPages/chat_page.dart';
import 'package:seedly/pages/mainMenuPages/profile_page.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  
  final screens = [
    Home(),
    CartPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
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
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
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
      ),
    );
  }
}