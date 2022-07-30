//* Firebase database


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//* Firebase database options
import 'package:seedly/firebase_options.dart';

//* Sign up and sign in pages
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';
import 'package:seedly/pages/mainMenuPages/buysuccess.dart';
import 'package:seedly/pages/mainMenuPages/home.dart';
import 'package:seedly/pages/mainMenuPages/myorders.dart';

//* Navigation bar widget
import 'package:seedly/ud_widgets/nav_bar.dart';

import 'pages/mainMenuPages/payment.dart';

//* navigator key
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  //* Initialized widgets and firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    
    //* Initial nga page nga e run
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    //* mga page routes
    routes: {
      '/': (context) => const LoadingPage(),  //* Loading screen
      '/onboard': (context) => const OnboardPage(), //* Onboard page
      '/onboard/login': (context) => LoginPage(), //* Log in page
      '/onboard/signup': (context) => SignupPage(), //* Sign up page
      
      '/navbar': (context) => NavBar(), //* Navigation bar widget that connects 4 different pages
      
      '/home': (context) => Home(),
      '/payment':(context) => Payment(),
      '/success': (context) => Success(),
      '/purchases': (context) => Purchases(),
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
}