import 'package:flutter/material.dart';
import 'package:seedly/constants.dart';

class Purchases extends StatefulWidget {
  const Purchases({super.key});

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.green[200]),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Constants.blackColor,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
              // child: ListView.builder(
              //     itemCount: widget.favoritedPlants.length,
              //     scrollDirection: Axis.vertical,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (BuildContext context, int index) {
              //       return PlantWidget(
              //           index: index, plantList: widget.favoritedPlants);
              //     }),
      ),
    );
  }
}