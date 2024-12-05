import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0b1028), // Màu nền tùy chỉnh
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa hình ảnh
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Bo góc hình ảnh
                  child: Image.asset(
                    'assets/logo.png', // Đường dẫn ảnh
                    width: 120, // Chiều rộng
                    height: 120, // Chiều cao
                    fit: BoxFit.cover, // Cách hiển thị ảnh
                  ),
                ),
              ],
            ),
            const SizedBox(height: 54), // Khoảng cách giữa ảnh và text
            const Text(
              "New Experience",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            const Text(
              "Watch a new movie much \n easier than any before",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 72),
            SizedBox(
              width: 255,
              height: 61,
              child: ElevatedButton(
                onPressed: () {
                  // Chuyển sang màn hình Home
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
