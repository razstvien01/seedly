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
  // final Map<int, dynamic> plantSave;
  late List<bool> plantCart;
  late List<bool> plantFav;
  
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
    plantCart = [];
    plantFav = [];
    
    for(int i = 0; i < Plant.plantList.length; ++i){
      plantFav.add(Plant.plantList[0].isFavorated);
    }
    
    for(int i = 0; i < Plant.plantList.length; ++i){
      plantCart.add(Plant.plantList[0].isSelected);
    }
  }
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'address': address,
    'contact_number': contact_number,
    'plantFav': plantFav,
    'plantCart': plantCart,
  };
  
  // static UserDetails fromJson(Map<String, dynamic> json) =>  UserDetails(
  //   name: json['name'],
  //   email: json['email'],
  //   address: json['address'],
  //   contact_number: json['contact_number'],
  // );
}