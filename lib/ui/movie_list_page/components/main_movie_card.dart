import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_animation_app/models/movie_model.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/row_star.dart';

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({
    Key? key,
    required this.factorChange,
    required this.movie,
  }) : super(key: key);

  final double factorChange;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: lerpDouble(size.height * 0.3, size.height * 0.35, factorChange),
          left: 10,
          right: 10,
          bottom: 0,
          child: Hero(
            tag: "$movie +${movie.title}",
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity((1 - factorChange).clamp(0.7, 1.0)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  //* ----------------------------------
                  //* The Movie Poster
                  //* ----------------------------------
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 20.0,
                        bottom: 10.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.red,
                          child: Image.asset(
                            movie.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //* --------------------------------------
                  //* MainMovieCard Details
                  //* --------------------------------------
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                movie.genre.length,
                                (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: Text(
                                    movie.genre[index],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${movie.rating}"),
                              const SizedBox(width: 5),
                              RowStar(star: movie.stars),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                3,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
