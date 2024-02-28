import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/constants.dart';
import 'package:test_flutter/screens/detailPage.dart';

class trendingSlider extends StatelessWidget {
  const trendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          detail(movie: snapshot.data[itemIndex])));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 200,
                height: 300,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
