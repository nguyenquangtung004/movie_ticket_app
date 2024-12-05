import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hasImage = false; // Trạng thái: true nếu đã có ảnh, false nếu không có

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
                          text: 'Create New\n',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Your Account',
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

            // Nội dung chính
            Container(
              margin: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 120,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Hình ảnh người dùng
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              hasImage
                                  ? 'assets/real_user.png'
                                  : 'assets/users.png', // Ảnh động
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Biểu tượng (dấu cộng hoặc close)
                          Positioned(
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hasImage = !hasImage; // Đổi trạng thái khi nhấn
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  hasImage
                                      ? Icons.close
                                      : Icons.add, // Dấu cộng hoặc close
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildTextFormField("Full Name", "Enter your name"),
                  const SizedBox(height: 20),
                  _buildTextFormField("Email Address", "Enter your email"),
                  const SizedBox(height: 20),
                  _buildTextFormField("Password", "Enter your password",
                      obscureText: true),
                  const SizedBox(height: 20),
                  _buildTextFormField("Confirm Password",
                      "Enter your password again",
                      obscureText: true),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 255,
                      height: 61,
                      child: ElevatedButton(
                        onPressed: () {
                          // Chuyển sang màn hình Home
                          Navigator.pushReplacementNamed(context, '/user_profiling');
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
                          "Sign In",
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
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String hint,
      {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.white, // Màu chữ
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF4A90E2), // Màu của nhãn
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade600, // Màu placeholder
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Bo góc
          borderSide: const BorderSide(
            color: Color(0xFF4A90E2), // Màu viền khi không focus
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Bo góc
          borderSide: const BorderSide(
            color: Colors.blueAccent, // Màu viền khi focus
            width: 2.0, // Độ dày viền khi focus
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ), // Padding bên trong TextField
      ),
    );
  }
}
