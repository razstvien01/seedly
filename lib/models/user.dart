import 'package:flutter/material.dart';
import 'package:seedly/models/plants.dart';

void func(){
  // Plant.plantList.length
}
class UserDetails{
  final String name;
  final String email;
  final String address;
  final int contact_number; 
  // late Map<int, bool> plantCart;
  late Map<int, bool> plantFav;
  
  UserDetails(
    
    {
    required this.name,
    required this.email,
    required this.address,
    required this.contact_number,
    
    // required this.plantSave,
  }){
    // print(Plant.plantList[0]);
    // print(Plant.plantList[0].isFavorated);
    // plantCart = Map<int, bool>();
    // plantFav = Map<int, bool>();
    
    // for(int i = 0; i < Plant.plantList.length; ++i){
    //   // plantFav.add(Plant.plantList[0].isFavorated);
    //   plantFav[i] = Plant.plantList[i].isFavorated;
    // }
    
    // print(plantFav.toString());
    
    // for(int i = 0; i < Plant.plantList.length; ++i){
    //   plantCart[i] = Plant.plantList[i].isSelected;
    // }
  }
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'address': address,
    'contact_number': contact_number,
    // 'plantFav': {0: false},
    // 'plantCart': plantCart,
  };
}