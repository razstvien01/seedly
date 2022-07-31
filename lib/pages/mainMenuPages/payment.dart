import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/pages/mainMenuPages/buysuccess.dart';
import 'package:seedly/pages/mainMenuPages/details_page.dart';
import 'package:seedly/pages/mainMenuPages/profile_page.dart';
import 'package:seedly/ud_widgets/rounded_gbutton.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  dynamic value = 0;
  
  final paymentLabels = [
    'Cash on delivery',
    'Credit card / Debit card',
    'Gcash',
    'Google wallet',
  ];

  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Payment',
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
      
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Choose your payment method',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            
            Expanded(
              child: ListView.separated(
                itemCount: paymentLabels.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Radio(
                      activeColor: Constants.blackColor,
                      value: index,
                      groupValue: value,
                      onChanged: (i) => setState(() {
                        print(i);
                        value = i;
                      }),
                    ),
                    title: Text(
                      paymentLabels[index],
                      style: TextStyle(color: Constants.blackColor),
                    ),
                    trailing: Icon(paymentIcons[index], color: Constants.blackColor),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
            
            
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: RoundedGreenButton(onColor: true, text: 'Comfirm', routeKey: '/navbar',
              onPressed: () {
                print('value pressed ${value}');
                if(value == 0){
                  final currentUser = FirebaseAuth.instance.currentUser;
                  final docUser = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
                  
                  total_orders += 1;
                  
                  // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                  // String string = dateFormat.format(DateTime.now());
                  
                  DateTime dtDO= DateTime.now();
                  DateTime dtDD = DateTime.now().add(new Duration(days: 7));
                  
                  String dateOrder = DateFormat('yyyy-MM-dd – kk:mm').format(dtDO);
                  
                  String dateDelivered = DateFormat('yyyy-MM-dd – kk:mm').format(dtDD);
                  
                  docUser.update({
                    'orders.${total_orders}': {
                        'plant_name': Plant.plantList[currentIdPlant].plantName,
                        'plant_price': Plant.plantList[currentIdPlant].price,
                        'plant_index': currentIdPlant,
                        'date_ordered': dateOrder,
                        'date_delivered': dateDelivered,
                      
                      // 'Time ordered': {DateTime.now()},
                      
                    }
                    
                    // 'plant_orders.${total_orders}': {
                    //   currentIdPlant,
                    //   'Time ordered': DateTime.now(),
                      
                    // }
                  });
                  
                  
                  
                  Navigator.pushNamed(context, '/success');
                }
              },
              ),
            )
          ],
        ),
      ),
    );
  }
  
  
}