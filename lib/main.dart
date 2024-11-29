import 'package:flutter/material.dart';
import './Componets/header.dart'; // Import CustomAppBar từ header.dart

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
          appBar: CustomAppBar(), // Sử dụng CustomAppBar từ header.sdart
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
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
