import 'package:flutter/material.dart';

class ConfirmationProfileScreen extends StatelessWidget {
  const ConfirmationProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom AppBar
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF0b1028), // Màu nền AppBar
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16), // Bo góc phía dưới AppBar
                ),
              ),
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Quay lại màn hình trước
                        },
                      ),
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Confirm New \n',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Account',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 112,
            ),
            ClipRRect(
              child: Image.network(
                "https://i.pinimg.com/236x/2a/96/4a/2a964a0c363f703f515440bc929b5d79.jpg",
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(250),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Welcome \n',
                    style: const TextStyle(
                
                      fontSize: 24, // Kích thước chữ mặc định cho đoạn "Welcome"
                      
                    ),
                    children: [
                      TextSpan(
                        text: 'Arya Wijaya',
                        style: const TextStyle(
                          fontSize: 30, // Kích thước chữ riêng cho "Arya Wijaya"
                          fontWeight: FontWeight.bold, // Đậm nét chữ
                          color: Colors.blue, // Màu chữ riêng
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 32,
            ),
            Center(
                    child: SizedBox(
                      width: 255,
                      height: 61,
                      child: ElevatedButton(
                        onPressed: () {
                          // Chuyển sang màn hình Home
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          "Create My Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
