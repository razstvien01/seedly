
import 'package:flutter/material.dart';
import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/pages/mainMenuPages/details_page.dart';
import 'package:page_transition/page_transition.dart';

class PlantWidget extends StatelessWidget {
  // final Widget widget;
  String orderDate;
  String deliveryDate;
  
  PlantWidget(
    {
    Key? key, required this.index, required this.plantList, this.isOrder = false, this.orderDate = '', this.deliveryDate = '',
  }) : super(key: key);
  
  final bool isOrder;
  final int index;
  final List<Plant> plantList;
  
  void clickNewPlantItem(BuildContext context){
    print('plant item has been clicked at H views');
    Navigator.push(
      context,
      PageTransition(
        child: DetailPage(
        plantId: plantList[index].plantId,
        ),
      type: PageTransitionType.bottomToTop));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => clickNewPlantItem(context),
      
      child: (isOrder) ? ordersListUI(size) : cartOrFavListUI(size),
    );
  }

  Container cartOrFavListUI(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.8),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 80.0,
                  child:
                  Image.asset(plantList[index].imageURL),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plantList[index].category),
                    Text(
                      plantList[index].plantName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              r'$' + plantList[index].price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Constants.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Container ordersListUI(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 80.0,
                      child:
                      Image.asset(plantList[index].imageURL),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantList[index].category),
                        Text(
                          plantList[index].plantName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  r'$' + plantList[index].price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Constants.primaryColor,
                  ),
                ),
              )
            ],
          ),
          
          SizedBox(height: 10,),
          
          Text(
            'Date Ordered: ${orderDate}\nExpected Delivery Date: ${deliveryDate}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Constants.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}