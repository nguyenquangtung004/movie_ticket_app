import 'package:flutter/material.dart';

class TopUpEmpty extends StatelessWidget {
  const TopUpEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
        backgroundColor: const Color(0xFF0b1028),
      ),
      backgroundColor: const Color(0xFF0b1028),
      body: const Center(
        child: Text(
          "This is the Top Up screen!",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
