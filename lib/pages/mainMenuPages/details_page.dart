import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedly/constants.dart';
import 'package:seedly/models/plants.dart';
import 'package:seedly/pages/mainMenuPages/cart_page.dart';

int currentIdPlant = 0;
class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                CloseButton(context),
                
                FavButton(_plantList),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            title: 'Size',
                            plantFeature: _plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'Humidity',
                            plantFeature:
                                _plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeature(
                            title: 'Temperature',
                            plantFeature:
                                _plantList[widget.plantId].temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          plantDetails(size, _plantList),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            cartFAButton(_plantList),
            const SizedBox(
              width: 20,
            ),
            
            buyNowButton(),
          ],
        ),
      ),
    );
  }

  Expanded buyNowButton() {
    return Expanded(
      child: TextButton(
        onPressed: (){
          currentIdPlant = widget.plantId;
          
          Navigator.pushNamed(context, '/success');
        },
        child: Container(
          decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Constants.primaryColor.withOpacity(.3),
            )
          ]),
          child: Center(
            child: Text(
              'BUY NOW',
              style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
                    ),
                  ),
                ),
              ),
      ),
          );
  }

  Container cartFAButton(List<Plant> _plantList) {
    return Container(
            height: 50,
            width: 50,
            child: IconButton(onPressed: (){
              final user = FirebaseAuth.instance.currentUser;
              final docUser = FirebaseFirestore.instance.collection('users').doc(user?.uid);
              
              setState(() {
                bool isSelected = toggleIsSelected(_plantList[widget.plantId].isSelected);
                
                print(isSelected);
                
                total_price = (isSelected) ? total_price + _plantList[widget.plantId].price : total_price - _plantList[widget.plantId].price;
                
                _plantList[widget.plantId].isSelected = isSelected;
              });
              
              docUser.update({
                'cart_plants.${widget.plantId}': _plantList[widget.plantId].isSelected,
                'total_price': total_price,
              });
              
              
            }, icon: Icon(
              Icons.shopping_cart,
              color: _plantList[widget.plantId].isSelected == true ? Colors.white : Constants.primaryColor,
            )),
            decoration: BoxDecoration(
                color: _plantList[widget.plantId].isSelected == true ? Constants.primaryColor.withOpacity(.5) : Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Constants.primaryColor.withOpacity(.3),
                  ),
                ]),
          );
  }

  Positioned plantDetails(Size size, List<Plant> _plantList) {
    return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
              color: Constants.primaryColor.withOpacity(.4),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _plantList[widget.plantId].plantName,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          r'$' + _plantList[widget.plantId].price.toString(),
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _plantList[widget.plantId].rating.toString(),
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Constants.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 30.0,
                          color: Constants.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Text(
                    _plantList[widget.plantId].decription,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 18,
                      color: Constants.blackColor.withOpacity(.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  GestureDetector CloseButton(BuildContext context) {
    return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Constants.primaryColor.withOpacity(.15),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Constants.primaryColor,
                  ),
                ),
              );
  }

  GestureDetector FavButton(List<Plant> _plantList) {
    return GestureDetector(
      onTap: () {
        debugPrint('favorite');
        
      },
      child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Constants.primaryColor.withOpacity(.15),
                  ),
                  child: IconButton(
                      onPressed: () {
                        final user = FirebaseAuth.instance.currentUser;
                        final docUser = FirebaseFirestore.instance.collection('users').doc(user?.uid);
                        
                        setState(() {
                          bool isFavorited = toggleIsFavorated(
                              _plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated =
                              isFavorited;
                        });
                        
                        docUser.update({
                          'favorite_plants.${widget.plantId}': _plantList[widget.plantId].isFavorated
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      )),
                ),
              );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
