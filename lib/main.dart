import 'package:flutter/material.dart';

import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

import 'package:seedly/pages/mainMenuPages/home.dart';

void main() => runApp(MaterialApp(
  // home: Log_In(),
  
  //* Initial nga page nga e run
  initialRoute: '/onboard/login/home',
  debugShowCheckedModeBanner: false,
  
  routes: {
    '/': (context) => LoadingPage(),
    '/onboard': (context) => Onboard_Page(),
    '/onboard/login': (context) => Login_Page(),
    '/onboard/signup': (context) => Signup_Page(),
    '/onboard/login/home': (context) => Home(),
  },
  
  theme: ThemeData(
    primaryColor: Colors.green[400],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      // color: Colors.black,
    ),
    
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  ),
  
));
