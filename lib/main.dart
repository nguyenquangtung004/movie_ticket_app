import 'package:flutter/material.dart';
import './Componets/header.dart';
import './Componets/search.dart';
import './Componets/category_item.dart';

void main() {
  runApp(const MainApp());
}

// MainApp Widget
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
      home: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          body: const CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
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

  int _selectedIndex = 0;

  final List<Map<String, dynamic>> sliderData = [
    {
      "title": "Movie 1",
      "rate": "8.5/10",
      "image": "https://cdn.pixabay.com/photo/2020/04/20/18/10/cinema-5069314_1280.jpg",
    },
    {
      "title": "Movie 2",
      "rate": "7.9/10",
      "image": "https://cdn.pixabay.com/photo/2023/11/10/16/05/anime-8379662_640.jpg",
    },
    {
      "title": "Movie 3",
      "rate": "9.0/10",
      "image": "https://cdn.pixabay.com/photo/2020/08/27/18/49/people-5522679_640.jpg",
    },
    {
      "title": "Movie 4",
      "rate": "8.3/10",
      "image": "https://cdn.pixabay.com/photo/2017/08/02/00/07/people-2568887_640.jpg",
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          SizedBox(
            height: 60,
            child: Row(
              children: const [
                SearchWidget(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Categories
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: CategoryItem(
                    isSelected: index == _selectedIndex,
                    title: items[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Now Playing
          const Text(
            "Now Playing",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Slider
          SizedBox(
            height: 220, // Đặt chiều cao cố định cho slider
            child: PageView.builder(
              controller: _pageController,
              itemCount: sliderData.length,
              itemBuilder: (context, index) {
                final data = sliderData[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double scale = 1.0;
                    if (_pageController.position.haveDimensions) {
                      scale = _pageController.page! - index;
                      scale = (1 - scale.abs() * 0.3).clamp(0.85, 1.0);
                    }

                    return Center(
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 300,
                          height: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  data["image"],
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 200,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey,
                                      child: const Center(
                                        child: Text(
                                          'Image Error',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["title"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      data["rate"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
