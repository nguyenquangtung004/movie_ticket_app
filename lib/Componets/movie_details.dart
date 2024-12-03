import 'package:flutter/material.dart';
import 'dart:ui';
import '../View/booking_screen.dart'; // Import màn hình mới

class MovieDetails extends StatefulWidget {
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
  bool _showOverlay = false; // Quản lý trạng thái hiển thị overlay

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay; // Chuyển trạng thái khi double tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: _toggleOverlay,
          child: Stack(
            children: [
              // Ảnh chính
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.imageUrl,
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              if (_showOverlay) ...[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.event_seat,
                      color: Colors.white.withOpacity(0.8),
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      // Điều hướng đến màn hình "Đặt vé"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(
                              title: widget.title), // Truyền tiêu đề
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Đặt vé",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "5/5",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Action adventure, Comedy \n1h 41min ",
                style: TextStyle(
                  color: Color.fromARGB(255, 105, 104, 104),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
