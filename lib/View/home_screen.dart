import 'package:flutter/material.dart';
import 'package:movie_ticket_app/Componets/header.dart';
import '../Componets/search.dart';
import '../Componets/slider_widget.dart';
import '../Componets/card_item_promo.dart';
import '../Componets/promo_card_2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
       'All',
      'Drama',
      'Comedy',
      'Horror',
      'Romance',
      'Sci-Fi',
      'Fantasy',
      'Thriller',
      'Adventure',
      'Mystery',
    ];

    final List<Map<String, dynamic>> sliderData = [
      {
        "title": "Movie 1",
        "rate": 4.5,
        "image":
            "https://cdn.pixabay.com/photo/2020/04/20/18/10/cinema-5069314_1280.jpg",
      },
      {
        "title": "Movie 2",
        "rate": 4.0,
        "image":
            "https://cdn.pixabay.com/photo/2023/11/10/16/05/anime-8379662_640.jpg",
      },
      {
        "title": "Movie 3",
        "rate": 5.0,
        "image":
            "https://cdn.pixabay.com/photo/2020/08/27/18/49/people-5522679_640.jpg",
      },
      {
        "title": "Movie 4",
        "rate": 3.5,
        "image":
            "https://cdn.pixabay.com/photo/2017/08/02/00/07/people-2568887_640.jpg",
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBody(
        items: items,
        sliderData: sliderData,
      ),
    );
  }
}

class CustomBody extends StatefulWidget {
  final List<String> items;
  final List<Map<String, dynamic>> sliderData;

  const CustomBody({
    Key? key,
    required this.items,
    required this.sliderData,
  }) : super(key: key);

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  int selectedIndex = 0; // Chỉ mục của danh mục được chọn

  @override
  Widget build(BuildContext context) {
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
            // Danh mục
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Cập nhật danh mục được chọn
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.blueAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(
                            widget.items[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Now Showing",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            SliderWidget(sliderData: widget.sliderData),
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
                  "Promotions",
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
