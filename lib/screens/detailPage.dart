import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_flutter/constants.dart';
import 'package:test_flutter/models/movie.dart';

class detail extends StatelessWidget {
  const detail({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 58, 58, 58),
                // color: Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movie.title,
              style: GoogleFonts.belleza(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${constants.imagePath}${movie.posterPath}'),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Overview',
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  movie.overview,
                  style: GoogleFonts.belleza(
                      fontSize: 24, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text(
                            'Release Date: ',
                            style: GoogleFonts.belleza(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            movie.releaseDate,
                            style: GoogleFonts.belleza(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text(
                            'Rating ',
                            style: GoogleFonts.belleza(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            "${movie.voteAverage.toStringAsFixed(1)}/10",
                            style: GoogleFonts.belleza(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
