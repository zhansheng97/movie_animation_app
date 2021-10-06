import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_animation_app/models/movie_model.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/custom_button.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/row_star.dart';

class MovieDetailpage extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailpage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailpageState createState() => _MovieDetailpageState();
}

class _MovieDetailpageState extends State<MovieDetailpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 1.0, end: 0.0),
        builder: (context, value, child) {
          // print(value);
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.7,
                      child: Stack(
                        children: [
                          Container(color: Colors.black),
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
                ),
                Positioned(
                  top: size.height * 0.3,
                  left: size.width * 0.17 * value,
                  right: size.width * 0.17 * value,
                  bottom: 0,
                  child: Hero(
                    tag: "$widget.movie +${widget.movie.title}",
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          if (value > 0)
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 10.0,
                                ),
                                child: Transform.scale(
                                  scale: 1.0 * value,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.red,
                                      child: Image.asset(
                                        widget.movie.image,
                                        fit: BoxFit.cover,
                                      ),
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
                                  if (value == 0) SizedBox(height: 40),
                                  Column(
                                    children: [
                                      Text(
                                        widget.movie.title,
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(
                                            widget.movie.genre.length,
                                            (index) => Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0)),
                                              child: Text(
                                                widget.movie.genre[index],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${widget.movie.rating}"),
                                          const SizedBox(width: 5),
                                          RowStar(star: widget.movie.stars),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Director / ${widget.movie.director}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        Transform.translate(
                                          offset:
                                              Offset(0, size.height * value),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  "Actors",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                height: 125,
                                                width: double.infinity,
                                                child: Container(
                                                  // color: Colors.blue,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: widget.movie
                                                            .actors.length +
                                                        1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index ==
                                                          widget.movie.actors
                                                              .length)
                                                        return SizedBox(
                                                            width: 20);
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0),
                                                        child: AspectRatio(
                                                          aspectRatio: 0.8,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AspectRatio(
                                                                aspectRatio:
                                                                    1.0,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  child: Image
                                                                      .asset(
                                                                    widget
                                                                        .movie
                                                                        .actors[
                                                                            index]
                                                                        .image,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                "${widget.movie.actors[index].name}",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                              ),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Introduction",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      widget.movie.description,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                      ),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 80,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.linear,
                  builder: (context, value, child) {
                    return Positioned(
                      bottom: 30,
                      left: size.width * (0.1 * (2 * value).clamp(1.0, 2.0)),
                      right: size.width * (0.1 * (2 * value).clamp(1.0, 2.0)),
                      child: CustomButton(
                        onTap: () {},
                        title: "Buy Ticket",
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.white30,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
