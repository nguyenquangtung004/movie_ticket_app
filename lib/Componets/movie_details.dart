import 'package:flutter/material.dart';
import 'dart:ui';
import '../View/booking_screen.dart'; // TODO: Import màn hình đặt vé

class MovieDetails extends StatefulWidget {
  // TODO: Nhận tiêu đề và đường dẫn ảnh từ bên ngoài
  final String title;
  final String imageUrl;

  const MovieDetails({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool _showOverlay = false; // TODO: Trạng thái hiển thị overlay

  void _toggleOverlay() {
    // TODO: Thay đổi trạng thái hiển thị overlay khi người dùng nhấn đúp
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // TODO: Căn nội dung bắt đầu từ trên
      children: [
        GestureDetector(
          onDoubleTap: _toggleOverlay, // FIXME: Kiểm tra hoạt động nhấn đúp
          child: Stack(
            children: [
              // TODO: Hiển thị ảnh chính
              ClipRRect(
                borderRadius: BorderRadius.circular(12), // TODO: Bo góc ảnh
                child: Image.network(
                  widget.imageUrl, // FIXME: Đảm bảo đường dẫn ảnh luôn hợp lệ
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              if (_showOverlay) ...[
                // TODO: Hiển thị overlay khi được kích hoạt
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.event_seat,
                      color: Colors.white.withOpacity(0.8), // TODO: Biểu tượng overlay
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8, // TODO: Vị trí của nút "Đặt vé"
                  left: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Điều hướng đến màn hình "Đặt vé"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(
                              title: widget.title), // FIXME: Truyền tiêu đề phim
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // TODO: Bo góc container
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // TODO: Hiệu ứng mờ nền
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 6), // TODO: Padding nội dung
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2), // TODO: Nền mờ cho nút
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Đặt vé",
                            style: TextStyle(
                              color: Colors.white, // TODO: Màu chữ của nút
                              fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm
                              fontSize: 14, // TODO: Kích thước chữ
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 16), // TODO: Khoảng cách giữa ảnh và nội dung bên cạnh
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // TODO: Căn nội dung sang trái
            children: [
              // TODO: Hiển thị tiêu đề phim
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white, // TODO: Màu chữ
                  fontSize: 22, // TODO: Kích thước chữ
                  fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm
                ),
              ),
              const SizedBox(height: 8), // TODO: Khoảng cách giữa tiêu đề và đánh giá
              Row(
                children: [
                  // TODO: Hiển thị đánh giá sao
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star, // FIXME: Hiển thị 5 sao cố định
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  const SizedBox(width: 8), // TODO: Khoảng cách giữa sao và điểm đánh giá
                  const Text(
                    "5/5", // TODO: Điểm đánh giá
                    style: TextStyle(
                      color: Colors.white, // TODO: Màu chữ
                      fontSize: 18, // TODO: Kích thước chữ
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8), // TODO: Khoảng cách giữa đánh giá và mô tả
              // TODO: Hiển thị mô tả phim
              const Text(
                "Action adventure, Comedy \n1h 41min ",
                style: TextStyle(
                  color: Color.fromARGB(255, 105, 104, 104), // TODO: Màu chữ mô tả
                  fontSize: 18, // TODO: Kích thước chữ mô tả
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
