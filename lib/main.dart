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

// CustomBody Widget
class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

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
              children: [
                SearchWidget(),
              ],
            ),
          ),
          // Add more widgets/content below
          const SizedBox(height: 16), // Khoảng cách
          Text(
            'This is the body content!',
            style: Theme.of(context).textTheme.bodyLarge,
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
                    Color.fromRGBO(98, 179, 246, 1)
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.settings_input_composite_outlined, // Thay đổi thành biểu tượng điều khiển
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
