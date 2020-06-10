import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image1.jpg',
    title: 'HR Solutions',
    description:
        'Our solutions reduce HR Cost, Time saving and provides your business with advance technologies including project management tools and risk mitigation strategies.',
  ),
  Slide(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Trading and Investment',
    description:
        'Middle and back-office trading & investment management system.',
  ),
  Slide(
    imageUrl: 'assets/images/image3.jpg',
    title: 'Start Now',
    description:
        'The CAVIDEL automated trade simulation system (CATSS) is aimed at promoting financial literacy both on a global and micro scale.',
  ),
];
