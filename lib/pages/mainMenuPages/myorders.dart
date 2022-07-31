import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/ud_widgets/plant_widget.dart';

class Purchases extends StatefulWidget {
  Map<String, dynamic> data = {};

  Purchases({super.key});

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return dataLoad(context, size);
  }
  
  FutureBuilder<DocumentSnapshot?> dataLoad(context, size) {
    final user = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('users').doc(user?.uid);
    
    return FutureBuilder<DocumentSnapshot?>(
      future: docUser.get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          widget.data = snapshot.data!.data() as Map<String, dynamic>;
          
          // print(widget.data['orders']['1']['plant_index']);
          // print(widget.data['orders']);
          // print(widget.data['orders'].length);
          
          // Plant.plantOrders = widget.data['orders'];
          
          // widget.data.forEach((key, value) {
          //   if(key == 'orders'){
          //     Map v = widget.data[key];
          //     v.forEach((k, v) {
          //       Plant.plantOrders[k] = {
          //         k: v
          //       };
          //     });
          //   }
          // });
          
          // widget.data['orders'].re
          
          
          // print(Plant.plantOrders);
  //         List<Weight> weightData =
  // mapData.entries.map( (entry) => Weight(entry.key, entry.value)).toList();
  
          // List orderData = mapDatr
          
          return MyOrdersUI(context, size);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Scaffold MyOrdersUI(BuildContext context, Size size) {
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
    
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        alignment: Alignment.topCenter,
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              itemCount: widget.data['orders'].length,
              scrollDirection: Axis.vertical,
              reverse: true,
              shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      
                      print(widget.data['orders']['${index + 1}']['date_ordered']);
                      
                      return PlantWidget(
                          index: widget.data['orders']['${index + 1}']['plant_index'], 
                          // index: 0, 
                          plantList: Plant.plantList,
                          isOrder: true,
                          orderDate: widget.data['orders']['${index + 1}']['date_ordered'].toString(),
                          deliveryDate: widget.data['orders']['${index + 1}']['date_delivered'].toString(),
                      );
                      
                        
                    //     // return GestureDetector(
                    //     //   Text('')
                    //     // );
                    }
                    ),
          ),
      ),
    ),
  );
  }
}