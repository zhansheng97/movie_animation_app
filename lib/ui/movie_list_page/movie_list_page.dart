import 'package:flutter/material.dart';
import 'package:movie_animation_app/models/movie_model.dart';
import 'package:movie_animation_app/ui/movie_detail_page/movie_detail_page.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/background_movie_image.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/custom_button.dart';
import 'package:movie_animation_app/ui/movie_list_page/components/main_movie_card.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage>
    with SingleTickerProviderStateMixin {
  late PageController _backgroundController;
  late PageController _pageController;
  late int _backgroundPage;
  late double _page;

  @override
  void initState() {
    //* --------------------
    //* set initial BackgroundPage = 1
    //* --------------------
    _backgroundController = PageController(
      initialPage: 1,
    );

    //* --------------------
    //* set initial Page = 1 & ViewPort = 0.7, so can see other Page showing abit
    //* --------------------

    _pageController = PageController(
      viewportFraction: 0.7,
      initialPage: 1,
    );

    _backgroundPage = 1;
    _page = 1.0;

    //* --------------------------------
    //* give pageController listener, so when pageController.page is changing,
    //* we can update the value to the _page
    //* --------------------------------
    _pageController.addListener(_pageListener);

    super.initState();
  }

  void _pageListener() {
    _page = _pageController.page!;
    // print(_page);
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //* ---------------------------------
          //* Background Movie Image
          //* ---------------------------------
          PageView.builder(
            controller: _backgroundController,
            itemCount: MovieModel.moviesList.length,
            itemBuilder: (context, index) {
              final movie = MovieModel.moviesList[index];

              return BackgroundMovieImage(movie: movie);
            },
          ),
          //* -------------------------------
          //* Main Movie Card
          //* -------------------------------
          PageView.builder(
            controller: _pageController,
            itemCount: MovieModel.moviesList.length,
            onPageChanged: (value) {
              setState(() {
                //* -------------------------------------------------
                //* set the BackgroundPage value when page changing
                //* -------------------------------------------------
                _backgroundPage = value;
                // print(value);
                //* -------------------------------------------------
                //* called the BackgroundController animate to the page
                //* -------------------------------------------------
                _backgroundController.animateToPage(_backgroundPage,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            },
            itemBuilder: (context, index) {
              final movie = MovieModel.moviesList[index];

              //* --------------------------------------------------------
              //* In inistate, we already set the controller.page => _page
              //* _page is showing the current page index
              //* factorChange goes from 0 > 1
              //* ---------------------------------------------------------
              var factorChange = (_page - index).abs();

              return MainMovieCard(
                factorChange: factorChange,
                movie: movie,
              );
            },
          ),

          //* ------------------------
          //* Buy Ticket Button
          //* ------------------------
          Positioned(
            bottom: 30,
            left: size.width * 0.2,
            right: size.width * 0.2,
            child: CustomButton(
              title: "Buy Ticket",
              onTap: () {
                onTapTicketButton(MovieModel.moviesList[_backgroundPage]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void onTapTicketButton(MovieModel movie) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: MovieDetailpage(movie: movie),
          );
        },
      ),
    );
  }
}
