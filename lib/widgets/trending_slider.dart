import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class trendingSlider extends StatelessWidget {
  const trendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
            autoPlay: true,
            height: 300,
            viewportFraction: 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enlargeCenterPage: true,
            pageSnapping: true),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 200,
              height: 300,
              color: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}
