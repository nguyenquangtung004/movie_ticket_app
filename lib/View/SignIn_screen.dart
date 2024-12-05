import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0b1028), // Nền tối
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Container(
                margin: const EdgeInsets.only(top: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                ),
              ),
              // Welcome Text
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10),
                child: const Text(
                  "Welcome Back,\nMovie Lover!",
                  style: TextStyle(
                    color: Colors.white, // Màu chữ
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Khoảng cách với TextField
              // Email Address TextField
              TextFormField(
                style: const TextStyle(
                  color: Colors.white, // Màu chữ
                ),
                decoration: InputDecoration(
                  labelText: "Email Address", // Nhãn
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
              const SizedBox(height: 25),
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
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot PassWord ?",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 28),
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
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Create new account ?',
                    style: TextStyle(),
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(29, 150, 219, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset("assets/Social media-Facebook.png",width: 64,height: 64,),
                      
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ClipRRect(
                        child: Image.asset("assets/Social media-Google.png",width: 64,height: 64,),
                        
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
