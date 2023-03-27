import 'package:flutter/material.dart';

class FashionItems {
  final int id;
  final String image;
  final String title;
  final String description;
  final String brand;
  final String size;
  final String color;

  FashionItems(
      {
        required this.id,
        required this.image,
        required this.title,
        required this.description,
        required this.brand,
        required this.size,
        required this.color
      }
  );
}

List<FashionItems> fashionList = [
  FashionItems(
      id: 1,
      image: 'assets/images/black_leather_jacket.jpg',
      title: 'Black Leather Jacket',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim sed nunc sed tellus. Donec sodales morbi sed vestibulum egestas mus. Fringilla lacus facilisis hendrerit lacus ut. Sit arcu vitae imperdiet tempus volutpat.',
      brand : 'Cardinals',
      size: 'XL',
      color: 'Black'
  ),
  FashionItems(
      id: 2,
      image: 'assets/images/handbags_cream.png',
      title: 'JW Pei - Cream',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim sed nunc sed tellus. Donec sodales morbi sed vestibulum egestas mus. Fringilla lacus facilisis hendrerit lacus ut. Sit arcu vitae imperdiet tempus volutpat.',
      brand : 'JW Pei',
      size: '24.5cm x 12cm x 6cm',
      color: 'Cream'
  ),
  FashionItems(
      id: 3,
      image: 'assets/images/shoes.png',
      title: 'Nike - Men Skate Shoes',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim sed nunc sed tellus. Donec sodales morbi sed vestibulum egestas mus. Fringilla lacus facilisis hendrerit lacus ut. Sit arcu vitae imperdiet tempus volutpat.',
      brand : 'Nike',
      size: '43',
      color: 'Grey'
  )
];

