import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 60),
          child: const Center(
            child: Text(
              'Edit Your \n Profile',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 24, left: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
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
                            'assets/users.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Biểu tượng (dấu cộng hoặc close)
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add, // Dấu cộng hoặc close
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
              ),
              const SizedBox(
                height: 41,
              ),
              _buildTextFormField("Full Name", "Enter your name"),
              const SizedBox(height: 20),
              _buildTextFormField("Email Address", "Enter your email"),
              const SizedBox(height: 20),
              _buildTextFormField("Password", "Enter your password",
                  obscureText: true),
              const SizedBox(height: 20),
              _buildTextFormField("Confirm Password", "Enter your password again",
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
                      "Update My Profile",
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
        color: Colors.grey, // Màu của nhãn
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade600, // Màu placeholder
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // Bo góc
        borderSide: const BorderSide(
          color: Colors.grey // Màu viền khi không focus
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
