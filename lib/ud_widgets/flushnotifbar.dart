import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/nav_bar.dart';

class FlushNotifBar{
  static void showFlushNotifBar(BuildContext context, String title, String mText, int navIndex){
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
    boxShadows: [BoxShadow(color: Colors.greenAccent, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: true,
    duration: Duration(seconds: 2),
    icon: Icon(
      Icons.check,
      color: Colors.greenAccent,
    ),
    mainButton: ElevatedButton(
      onPressed: () {
        
        
    
    // FavoritePage();
    
    nav_index = navIndex;
    
        
        
        // Navigator.of(context).push(
      // MaterialPageRoute(builder: (context) => FavoritePage(favoritedPlants: favoritedPlants)),
    // );
        
        Navigator.of(context)
    .pushNamedAndRemoveUntil('/navbar', (Route<dynamic> route) => false);
      },
      child: Text(
        'View',
        style: TextStyle(color: Colors.white),
      ),
      // style: ElevatedButtonTheme(
      //   child: ,
      // ),
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      mText,
      style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
    ),
  ).show(context);
  }
}