import 'package:flutter/material.dart';
import './Componets/header.dart';

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
        primaryColor: const Color(0xFF0b1028), // Màu chính của theme
        scaffoldBackgroundColor: const Color(0xFF0b1028), // Màu nền
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0b1028), // Màu nền của AppBar
          foregroundColor: Colors.white, // Màu chữ và icon
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Màu chữ mặc định
          bodyMedium: TextStyle(color: Colors.white), // Màu chữ mặc định
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(), // Sử dụng CustomAppBar từ header.dart
          body: const CustomBody(), // Gọi Body tùy chỉnh
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
  // Danh sách các văn bản cho từng item
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

  // Lưu trạng thái item được chọn
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Thêm padding cho giao diện
      child: Column(
        children: [
          // Search bar container
          SizedBox(
            height: 60,
            child: Row(
              children: const [
                SearchWidget(),
              ],
            ),
          ),
          const SizedBox(height: 16), // Khoảng cách
          SizedBox(
            height: 70, // Chiều cao tổng của ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Cuộn theo chiều ngang
              itemCount: items.length, // Số lượng item dựa trên danh sách
              itemBuilder: (context, index) {
                final isSelected = index == _selectedIndex;

                return GestureDetector(
                  onTap: () {
                    // Thay đổi trạng thái item được chọn
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 120, // Chiều rộng từng item
                    margin: const EdgeInsets.only(
                        right: 16), // Khoảng cách giữa các item
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 150, 255, 1.0),
                                Color.fromRGBO(0, 180, 255, 1.0),
                              ],
                            )
                          : null, // Không gradient nếu không được chọn
                      color: isSelected
                          ? null
                          : const Color(0xFF0b1028), // Màu nền giống background
                      borderRadius: BorderRadius.circular(5),
                      // border: isSelected
                      //     ? Border.all(color: Colors.white, width: 2)
                      //     : null,
                    ),
                    child: Center(
                      child: Text(
                        items[index], // Text động từ danh sách
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 27, 50, 1.0),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            // Icon search
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            // TextField for search input
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Movie',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 73, 173, 255),
                    Color.fromRGBO(98, 179, 246, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.settings_input_composite_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Thêm hành động tại đây (nếu cần)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
