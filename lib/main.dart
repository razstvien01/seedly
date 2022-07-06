import 'package:flutter/material.dart';
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

void main() => runApp(MaterialApp(
  // home: Log_In(),
  
  //* Initial nga page nga e run
  initialRoute: '/onboard',
  debugShowCheckedModeBanner: false,
  
  routes: {
    '/': (context) => LoadingPage(),
    '/onboard': (context) => Onboard_Page(),
    '/login': (context) => Login_Page(),
    '/signup': (context) => Signup_Page(),
  },
  
  theme: ThemeData(
    primaryColor: Colors.green[400],
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[400],
    )
  ),
  
));
