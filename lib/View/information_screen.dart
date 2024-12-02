import 'package:flutter/material.dart';
import '../Componets/movie_details.dart';
import '../Componets/movie_poster.dart';
import '../Componets/movie_tabs.dart';

class Movie extends StatelessWidget {
  final String title;
  final String imageUrl;

  const Movie({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: DefaultTabController(
        length: 2, // Số lượng tab
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior:
                Clip.none, // Đảm bảo nội dung nằm ngoài Stack không bị cắt
            children: [
              Column(
                children: [
                  // Ảnh nền
                  MoviePoster(
                    imageUrl: imageUrl,
                    height: screenHeight / 3,
                  ),
                  const SizedBox(height: 100), // Không gian cho TabBar
                  Container(
                    color: const Color(0xFF0b1028),
                    child: const MovieTabs(),
                  ),
                ],
              ),
              // Nội dung trên ảnh nền
              Positioned(
                top: screenHeight / 3 - 90, // Điều chỉnh khoảng cách từ ảnh nền
                left: 16,
                right: 16,
                child: MovieDetails(
                  title: title,
                  imageUrl: imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
