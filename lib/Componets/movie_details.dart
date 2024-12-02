import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String imageUrl;

  const MovieDetails({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ảnh nhỏ
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 120,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16), // Khoảng cách giữa 2 cột
        // Tiêu đề và thông tin
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Hiển thị 5 ngôi sao
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  const SizedBox(width: 8), // Khoảng cách giữa sao và text
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
