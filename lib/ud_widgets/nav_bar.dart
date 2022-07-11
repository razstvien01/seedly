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
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart',
              selectedIcon: Icon(Icons.shopping_cart),
              
            ),
            
            NavigationDestination(
              icon: Icon(Icons.messenger_outline), label: 'Chat',
              selectedIcon: Icon(Icons.messenger),
            ),
            
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile',
              selectedIcon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}