import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_flutter/api/api.dart';
import 'package:test_flutter/models/movie.dart';
import 'package:test_flutter/widgets/movies_slider.dart';
import 'package:test_flutter/widgets/trending_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> trendingMovie;
  late Future<List<Movie>> topRatedMovie;
  late Future<List<Movie>> upcomingMovie;

  @override
  void initState() {
    super.initState();
    trendingMovie = Api().getTrendingMovies();
    topRatedMovie = Api().getTopRatedMovies();
    upcomingMovie = Api().getUpcomingMovies();
  }

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
                SizedBox(
                  child: FutureBuilder(
                      future: trendingMovie,
                      builder: ((context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return trendingSlider(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
                ),
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
                SizedBox(
                  child: FutureBuilder(
                      future: topRatedMovie,
                      builder: ((context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return moviesSlider(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
                ),
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
                SizedBox(
                  child: FutureBuilder(
                      future: upcomingMovie,
                      builder: ((context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return moviesSlider(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
                ),
              ],
            ),
          ),
        ));
  }
}
