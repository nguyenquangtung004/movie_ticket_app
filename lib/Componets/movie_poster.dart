import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final double height;

  const MoviePoster({
    Key? key,
    required this.imageUrl,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
