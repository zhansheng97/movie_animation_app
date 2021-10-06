class MovieModel {
  final String title;
  final List<String> genre;
  final double rating;
  final double stars;
  final String director;
  final List<Actor> actors;
  final String description;
  final String image;

  const MovieModel({
    required this.image,
    required this.title,
    this.genre = genreList,
    required this.rating,
    required this.stars,
    required this.director,
    this.description = loremIpsumDescription,
    this.actors = Actor.actorList,
  });

  static const List<MovieModel> moviesList = [
    MovieModel(
      image: "assets/images/good_boys.jpg",
      title: "Good Boys",
      rating: 7.8,
      stars: 4.0,
      director: "Gene Stupnitsky",
    ),
    MovieModel(
      image: "assets/images/joker.jpg",
      title: "Joker",
      rating: 9.0,
      stars: 4.5,
      director: "Todd Phillips",
    ),
    MovieModel(
      image: "assets/images/the_hustle.jpg",
      title: "The Hustle",
      rating: 9.0,
      stars: 3.5,
      director: "Chris Addison",
    ),
  ];
}

const List<String> genreList = ["Action", "Drama", "History"];

const String loremIpsumDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

class Actor {
  final String name;
  final String image;

  const Actor({
    required this.name,
    required this.image,
  });

  static const actorList = const [
    Actor(image: "assets/images/Jared_Leto.jpg", name: "Jared_Leto"),
    Actor(image: "assets/images/Joaquin_Phoenix.jpg", name: "Joaquin Phoenix"),
    Actor(image: "assets/images/robert_de_niro.jpg", name: "Robert De Niro"),
    Actor(image: "assets/images/zazie_beetz.jpg", name: "Zazie Beetz"),
  ];
}
