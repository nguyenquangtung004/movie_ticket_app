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
        child: Container(
          margin: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 120,
                  child: Stack(alignment: Alignment.center, children: [
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
                      right: 0,
                      left: 0,
                      
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hasImage = !hasImage; // Đổi trạng thái khi nhấn
                          });
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            hasImage
                                ? Icons.close
                                : Icons.add, // Dấu cộng hoặc close
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 50,
                      ),
                  ],
                  
                  ),
                ),
                
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white, // Màu chữ
                ),
                decoration: InputDecoration(
                  labelText: "Full Name", // Nhãn
                  labelStyle: const TextStyle(
                    color: Color(0xFF4A90E2), // Màu của nhãn
                  ),
                  floatingLabelBehavior:
                      FloatingLabelBehavior.auto, // Cách nhãn hoạt động
                  hintText: "Enter your name",
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
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white, // Màu chữ
                ),
                decoration: InputDecoration(
                  labelText: "Email Adress", // Nhãn
                  labelStyle: const TextStyle(
                    color: Color(0xFF4A90E2), // Màu của nhãn
                  ),
                  floatingLabelBehavior:
                      FloatingLabelBehavior.auto, // Cách nhãn hoạt động
                  hintText: "Enter your email",
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
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white, // Màu chữ
                ),
                decoration: InputDecoration(
                  labelText: "PassWord", // Nhãn
                  labelStyle: const TextStyle(
                    color: Color(0xFF4A90E2), // Màu của nhãn
                  ),
                  floatingLabelBehavior:
                      FloatingLabelBehavior.auto, // Cách nhãn hoạt động
                  hintText: "Enter your password",
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
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white, // Màu chữ
                ),
                decoration: InputDecoration(
                  labelText: "Confirm Password", // Nhãn
                  labelStyle: const TextStyle(
                    color: Color(0xFF4A90E2), // Màu của nhãn
                  ),
                  floatingLabelBehavior:
                      FloatingLabelBehavior.auto, // Cách nhãn hoạt động
                  hintText: "Enter your password",
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
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 255,
                  height: 61,
                  child: ElevatedButton(
                    onPressed: () {
                      // Chuyển sang màn hình Home
                      Navigator.pushReplacementNamed(context, '/home');
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
      ),
    );
  }
}
