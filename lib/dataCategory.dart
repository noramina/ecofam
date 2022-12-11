import 'package:flutter/material.dart';

class Category {
  final String image;
  final String title;
  final Color gradientcolor;

  Category({
    required this.image,
    required this.title,
    required this.gradientcolor,
  });
}

final List<Category> category = [
  Category(
      image: "Asset/Image/Forum/Category1/Banner.png",
      title: "All Category",
      gradientcolor: const Color.fromARGB(225, 0, 200, 255)),
  Category(
      image: "Asset/Image/Forum/Category1/Banner2.png",
      title: "Pregnancy",
      gradientcolor: const Color.fromARGB(255, 0, 120, 212)),
  Category(
      image: "Asset/Image/Forum/Category1/Banner3.png",
      title: "Child’s Well Being",
      gradientcolor: const Color.fromARGB(255, 80, 216, 216)),
  Category(
      image: "Asset/Image/Forum/Category1/Banner4.png",
      title: "Special Diet Cookbooks",
      gradientcolor: const Color.fromARGB(255, 245, 132, 52)),
  Category(
      image: "Asset/Image/Forum/Category1/Banner5.png",
      title: "Mother’s Lifestyle",
      gradientcolor: const Color.fromARGB(255, 255, 247, 0)),
];
