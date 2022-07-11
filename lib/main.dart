import 'package:flutter/material.dart';

//* Sign up and sign in pages
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

import 'package:seedly/ud_widgets/nav_bar.dart';

//* Home page
import 'package:seedly/pages/mainMenuPages/home.dart';

void main() => runApp(MaterialApp(
  // home: Log_In(),
  
  //* Initial nga page nga e run
  initialRoute: '/navbar',
  debugShowCheckedModeBanner: false,
  
  routes: {
    '/': (context) => const LoadingPage(),
    '/onboard': (context) => const OnboardPage(),
    '/onboard/login': (context) => const LoginPage(),
    '/onboard/signup': (context) => const SignupPage(),
    
    '/navbar': (context) => NavBar(),
    '/navbar/home': (context) => const Home(),
  },
  
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
