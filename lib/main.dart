import 'package:flutter/material.dart';
import './Navigation/nav_bottom.dart'; // Import Bottom Navigation
import './Componets/header.dart';
import './Componets/search.dart';
import './Componets/category_item.dart';
import './Componets/slider_widget.dart';
import './Componets/card_item_promo.dart';
import './Componets/promo_card_2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0b1028),
        scaffoldBackgroundColor: const Color(0xFF0b1028),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0b1028),
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const BottomNavBar(), // Chỉ định Bottom Navigation làm màn hình chính
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'All',
      'Drama',
      'Comedy',
      'Horror',
      'Romance',
      'Sci-fi',
      'Fantasy',
      'Thriller',
      'Adventure',
      'Mystery',
    ];

    final List<Map<String, dynamic>> sliderData = [
      {
        "title": "Movie 1",
        "rate": 4.5,
        "image": "https://cdn.pixabay.com/photo/2020/04/20/18/10/cinema-5069314_1280.jpg",
      },
      {
        "title": "Movie 2",
        "rate": 4.0,
        "image": "https://cdn.pixabay.com/photo/2023/11/10/16/05/anime-8379662_640.jpg",
      },
      {
        "title": "Movie 3",
        "rate": 5.0,
        "image": "https://cdn.pixabay.com/photo/2020/08/27/18/49/people-5522679_640.jpg",
      },
      {
        "title": "Movie 4",
        "rate": 3.5,
        "image": "https://cdn.pixabay.com/photo/2017/08/02/00/07/people-2568887_640.jpg",
      },
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                children: const [
                  SearchWidget(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    isSelected: false,
                    title: items[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Now Playing",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            SliderWidget(sliderData: sliderData),
            const SizedBox(height: 16),
            const Text(
              "Coming Soon",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            HorizontalCards(),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Promo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Color.fromRGBO(52, 173, 252, 1),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            VerticalCards(),
          ],
        ),
      ),
    );
  }
}
