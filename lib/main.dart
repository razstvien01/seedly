import 'package:flutter/material.dart';
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

void main() => runApp(MaterialApp(
  // home: Log_In(),
  
  initialRoute: '/onboard',
  
  routes: {
    '/': (context) => LoadingPage(),
    '/onboard': (context) => Onboard_Page(),
    '/login': (context) => Login_Page(),
    '/signup': (context) => Signup_Page(),
  },
));
