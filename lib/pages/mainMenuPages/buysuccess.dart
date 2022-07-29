import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/pages/mainMenuPages/cart_page.dart';
import 'package:seedly/pages/mainMenuPages/details_page.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  List<Plant> _plantList = Plant.plantList;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: 'assets/images/success.png',
            emptyMsg: 'Successfull!',
          ),
          
          
          
          SubTitle(subTitleText: 'You purchased this plant successfully'),
          
          Center(
            child: RoundedGreenButton(
              onColor: true,
              routeKey: '/navbar',
              text: 'OK',
              onPressed: (){
                
                final user = FirebaseAuth.instance.currentUser;
                final docUser = FirebaseFirestore.instance.collection('users').doc(user?.uid);
              
              setState(() {
                bool isSelected = false;
                
                if(_plantList[currentIdPlant].isSelected)
                  total_price -= _plantList[currentIdPlant].price;
                
                _plantList[currentIdPlant].isSelected = isSelected;
              });
              
              docUser.update({
                'cart_plants.${currentIdPlant}': _plantList[currentIdPlant].isSelected,
                'total_price': total_price,
              });
                
                
                Navigator.of(context)
    .pushNamedAndRemoveUntil('/navbar', (Route<dynamic> route) => false);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavBar()));
              },
            ),
          )
        ],
      ),
    );
  }
}

class EmptySection extends StatefulWidget {
  final String emptyImg, emptyMsg;
  const EmptySection({
    Key? key, required this.emptyImg, required this.emptyMsg,
  }) : super(key: key);

  @override
  State<EmptySection> createState() => _EmptySectionState();
}

class _EmptySectionState extends State<EmptySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(widget.emptyImg),
          height: 150,
        ),
        
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.emptyMsg,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontFamily: 'gilroy'
              ),
            ),
          ),
      ],
    );
  }
}

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key, required this.subTitleText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: Colors.grey[600],
          fontFamily: 'gilroy'
        ),
      ),
      
      
    );
  }
}