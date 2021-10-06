import 'package:flutter/material.dart';

class RowStar extends StatelessWidget {
  final double star;
  final double size;
  final Color color;

  const RowStar({
    Key? key,
    required this.star,
    this.size = 16.0,
    this.color = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fillStar = Icon(Icons.star, color: color, size: size);
    final _halfStar = Icon(Icons.star_half, color: color, size: size);
    final _voidStar =
        Icon(Icons.star_border_outlined, color: color, size: size);

    int fillStar = star.floor();
    final bool halfStar = (star - fillStar) >= 0.5;
    List<Widget> listStars = List.generate(fillStar, (index) => _fillStar);
    if (halfStar) {
      listStars.add(_halfStar);
    }

    listStars.addAll(
        List.generate((5 - listStars.length).floor(), (index) => _voidStar));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: listStars,
    );
  }
}
