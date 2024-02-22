import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
            height: 40,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 300,
                        viewportFraction: 0.55,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: const Duration(seconds: 3),
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
                )
              ],
            ),
          ),
        ));
  }
}
