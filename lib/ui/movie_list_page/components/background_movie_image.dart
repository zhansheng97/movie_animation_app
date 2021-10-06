import 'package:flutter/material.dart';
import 'package:movie_animation_app/models/movie_model.dart';

class BackgroundMovieImage extends StatelessWidget {
  const BackgroundMovieImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.7,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                bottom: -2,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0, 0.5],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
