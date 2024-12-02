import 'package:flutter/material.dart';
import '../View/information_screen.dart'; // Đảm bảo đường dẫn đúng

class HorizontalCards extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      "title": "Movie 1",
      "image": "https://i.pinimg.com/236x/b2/69/a0/b269a0783b22d878eae90b18a2642c41.jpg",
    },
    {
      "title": "Movie 2",
      "image": "https://i.pinimg.com/474x/df/03/37/df03378d92dc04f926c21e58a0a7a705.jpg",
    },
    {
      "title": "Movie 3",
      "image": "https://i.pinimg.com/236x/7d/76/d4/7d76d4a0e685c96bcb57e50fe7a86f78.jpg",
    },
    {
      "title": "Movie 4",
      "image": "https://i.pinimg.com/236x/b0/90/e7/b090e708d72e6d5da49d7d63bf6433be.jpg",
    },
    {
      "title": "Movie 5",
      "image": "https://i.pinimg.com/236x/ab/00/4a/ab004abc2eedce7236fa09389a9c02c0.jpg",
    },
    {
      "title": "Movie 6",
      "image": "https://i.pinimg.com/236x/39/cf/0a/39cf0a94b7c5737ef2c02deb47499454.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 147,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Movie(
                    title: data["title"]!,
                    imageUrl: data["image"]!,
                  ),
                ),
              );
            },
            child: Container(
              width: 103,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      data["image"]!,
                      width: 103,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data["title"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
