import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_flutter/widgets/movies_slider.dart';
import 'package:test_flutter/widgets/trending_slider.dart';

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
                const SizedBox(
                  height: 32,
                ),
                const trendingSlider(),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Top rated Movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                const moviesSlider(),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Upcoming Movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                const moviesSlider(),
              ],
            ),
          ),
        ));
  }
}
