import 'package:flutter/material.dart';

//* Sign up and sign in pages
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

//* Navigation bar widget
import 'package:seedly/ud_widgets/nav_bar.dart';

void main() => runApp(MaterialApp(
  //* Initial nga page nga e run

  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  
  //* mga page routes
  routes: {
    '/': (context) => LoadingPage(),  //* Loading screen
    '/onboard': (context) => const OnboardPage(), //* Onboard page
    '/onboard/login': (context) => const LoginPage(), //* Log in page
    '/onboard/signup': (context) => const SignupPage(), //* Sign up page
    
    '/navbar': (context) => NavBar(), //* Navigation bar widget that connects 4 different pages
  },
  
  //* Theme data
  theme: ThemeData(
    primaryColor: Colors.green[400],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
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
