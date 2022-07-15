import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seedly/firebase_options.dart';

//* Sign up and sign in pages
import 'package:seedly/pages/loading_page.dart';
import 'package:seedly/pages/log_in_pages/onboard_page.dart';
import 'package:seedly/pages/log_in_pages/login_page.dart';
import 'package:seedly/pages/log_in_pages/signup_page.dart';

//* Navigation bar widget
import 'package:seedly/ud_widgets/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // await Firebase.initializeApp(
  // Replace with actual values
  //   options: const FirebaseOptions(
  //     apiKey: "api key here",
  //     appId: "app id here",
  //     messagingSenderId: "messaging id",
  //     projectId: "project id here",
  //   )
  // );
  
  runApp(MaterialApp(
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
}