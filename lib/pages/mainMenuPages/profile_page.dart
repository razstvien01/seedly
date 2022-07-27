//* This .dart file is used for designing Profile page UI in main menu folder

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seedly/models/plants.dart';
// import 'package:seedly/models/user.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

import 'package:seedly/constants.dart';
import 'package:seedly/ud_widgets/profile_widget.dart';


class ProfilePage extends StatefulWidget {

  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(Plant.plantList[0].isFavorated);
    
    // return ProfileUI(size);
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot?>(
        future: FirebaseFirestore.instance.collection('users').doc('${user?.uid}').get(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            
            // print(data['favorites']);
            // print(data['favorites'][0]);
            
            
            return ProfileUI(size, data);
            
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  SafeArea ProfileUI(Size size, Map<String, dynamic> user) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(13),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
          width: 150,
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: ExactAssetImage('assets/images/Elysia.jpg'),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.primaryColor.withOpacity(.5),
              width: 5.0,
            ),
          ),
          ),
            
            const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user['name'],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                  height: 24,
                  child: Image.asset("assets/images/verified.png")),
            ],
          ),
        ),
            Text(
              user['email'],
                style: TextStyle(
                color: Constants.blackColor.withOpacity(.6),
              ),
            ),
            const SizedBox(
          height: 5,
        ),
        Text(
              '${user['contact_number']}',
                style: TextStyle(
                color: Constants.blackColor.withOpacity(.6),
              ),
          
            ),
        const SizedBox(
          height: 5,
        ),
        Text(
              '${user['address']}',
                style: TextStyle(
                color: Constants.blackColor.withOpacity(.6),
              ),
            ),
            
        SizedBox(
          // height: size.height * .8,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileWidget(
                icon: Icons.person,
                title: 'My Purchases',
              ),
              ProfileWidget(
                icon: Icons.settings,
                title: 'Settings',
              ),
              ProfileWidget(
                icon: Icons.chat,
                title: 'FAQs',
              ),
              ProfileWidget(
                icon: Icons.share,
                title: 'Share',
              ),
              
              RoundedGreenButton(
                onColor: true,
                onPressed: (){
                FirebaseAuth.instance.signOut();
              },
                routeKey: '/signout',
                text: 'Sign Out',
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}