import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Product {
  int? id;
  PickedFile? img;
  String? name;
  String? category;
  double? price;
  String? dateTime;
  String? email ;
  int? offer1, offer2;
  int? quantity;
  int? numView;
  int? likes;

  Product({
    required this.id,
    required this.img,
    required this.name,
    required this.numView,
    required this.quantity,
    required this.category,
    required this.email,
    required this.price,
    required this.dateTime,
    required this.offer1,
    required this.offer2,
    required this.likes,
  });
}

List<String> categoryDropDown = [
  'Category1',
  'Category2',
  'Category3',
  'Category4',
  'Category5',
  'Category6',
  'Category7',
  'Category8',
  'Category9',
  'Category10',
  'Category11',
];
