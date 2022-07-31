import 'package:flutter/material.dart';
import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/ud_widgets/plant_widget.dart';

int total_price = 0;

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/add-cart.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height * .85,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCartPlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        index: index, plantList: widget.addedToCartPlants, isOrder: false,
                        
                    );
                  }),
            ),
            Column(
              children: [
                const Divider(thickness: 1.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Totals',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                      Text('\$$total_price', style: TextStyle(
                        fontSize: 24.0,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ],
              
              
            ),
          ],
        ),
      ),
    );
  }
}
