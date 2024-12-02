import 'package:flutter/material.dart';

class VerticalCards extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(cardData.length, (index) {
          final card = cardData[index];
          return Container(
            width: 384,
            height: 84,
            margin: const EdgeInsets.only(bottom: 10), // Khoảng cách giữa các card
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(61, 90, 249, 1),
                  Color.fromRGBO(112, 131, 250, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Cột trái
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          card["description"]!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cột phải
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        card["info"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
