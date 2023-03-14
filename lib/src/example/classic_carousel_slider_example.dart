import 'package:classic_carousel_silder/classic_carousel_silder.dart';
import 'package:flutter/material.dart';

class UsageClassicCarouselSlider extends StatefulWidget {
  const UsageClassicCarouselSlider({super.key});

  @override
  State<UsageClassicCarouselSlider> createState() =>
      _UsageClassicCarouselSliderState();
}

class _UsageClassicCarouselSliderState
    extends State<UsageClassicCarouselSlider> {
  int selectedPage = 0;
  List<String> myImages = [];
  @override
  Widget build(BuildContext context) {
    return ClassicCarouselSlider(
      currentPage: 0,
      images: myImages,
      hight: 100,
      width: 200,
    );
  }
}
