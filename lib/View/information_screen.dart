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
    final screenHeight = MediaQuery.of(context).size.height; // TODO: Lấy chiều cao màn hình để điều chỉnh giao diện động

    return Scaffold(
      body: DefaultTabController(
        length: 2, // TODO: Cấu hình số lượng tab
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior:
                Clip.none, // FIXME: Kiểm tra xem nội dung ngoài Stack có thể bị cắt không
            children: [
              Column(
                children: [
                  // TODO: Hiển thị ảnh nền cho phần thông tin phim
                  MoviePoster(
                    imageUrl: imageUrl,
                    height: screenHeight / 3, // FIXME: Điều chỉnh chiều cao ảnh nền phù hợp
                  ),
                  const SizedBox(height: 100), // TODO: Dành không gian cho TabBar
                  Container(
                    color: const Color(0xFF0b1028), // TODO: Đặt màu nền cho TabBar
                    child: const MovieTabs(), // TODO: Hiển thị tab cho thông tin phim
                  ),
                ],
              ),
              // TODO: Thêm nội dung nổi trên ảnh nền
              Positioned(
                top: screenHeight / 3 - 90, // FIXME: Điều chỉnh khoảng cách từ ảnh nền cho phù hợp
                left: 16,
                right: 16,
                child: MovieDetails(
                  title: title, // TODO: Hiển thị tiêu đề phim
                  imageUrl: imageUrl, // TODO: Hiển thị ảnh đại diện của phim
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
