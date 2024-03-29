//* This .dart file is used for designing customize Navigation bar widget for connecting 4 major pages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//* User defined widgets
import 'package:seedly/pages/mainMenuPages/home.dart';
import 'package:seedly/pages/mainMenuPages/cart_page.dart';
import 'package:seedly/pages/mainMenuPages/profile_page.dart';
import 'package:seedly/pages/mainMenuPages/favorite_page.dart';

import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

int nav_index = 0;

class NavBar extends StatefulWidget {
  static int index = 0;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int bottomNavIndex = NavBar.index;
  
  _NavBarState(){
    final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
                final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
        
                favorites = favoritedPlants;
                myCart = addedToCartPlants.toSet().toList();
    // nav_index = bottomNavIndex;
    bottomNavIndex = nav_index;
  }
  
  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const Home(),
      CartPage(addedToCartPlants: myCart,),
      FavoritePage(favoritedPlants: favorites),
      ProfilePage(),
    ];
  }

  //List of the pages icons
  // List<IconData> iconList = [
  //   Icons.home,
  //   Icons.shopping_cart,
  //   Icons.favorite,
  //   Icons.person,
  // ];
  
  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.person, size: 30),
  ];
  
  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Cart',
    'Favorite',
    'Profile',
  ];
  
  @override
  Widget build(BuildContext context) {
    return navbar_ui(context);
  }

  Scaffold navbar_ui(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(titleList[bottomNavIndex], style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),),
              Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)
            ],
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: IndexedStack(
          index: bottomNavIndex,
          children: _widgetOptions(),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        //   },
        //   child: Image.asset('assets/images/code-scan-two.png', height: 30.0,),
        //   backgroundColor: Constants.primaryColor,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        // bottomNavigationBar: CurvedNavigationBar(
        //   splashColor: Constants.primaryColor,
        //   activeColor: Constants.primaryColor,
        //   inactiveColor: Colors.black.withOpacity(.5),
        //   icons: iconList,
        //   activeIndex: _bottomNavIndex,
        //   gapLocation: GapLocation.none,
          
        //   // gapLocation: GapLocation.center,
        //   notchSmoothness: NotchSmoothness.softEdge,
        //   onTap: (index){
            // setState(() {
            //   _bottomNavIndex = index;
            //   final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            //   final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
  
            //   favorites = favoritedPlants;
            //   myCart = addedToCartPlants.toSet().toList();
            // });
        //   }
        // ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            color: Constants.primaryColor,
            backgroundColor: Colors.transparent,
            items: items,
            index: bottomNavIndex,
            height: 60,
            buttonBackgroundColor: Colors.green[300],
            
            onTap: (index){
              setState(() {
                bottomNavIndex = index;
                final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
                final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
        
                favorites = favoritedPlants;
                myCart = addedToCartPlants.toSet().toList();
              });
            },
          ),
        ),
      );
  }
}