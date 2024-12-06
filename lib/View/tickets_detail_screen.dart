import 'package:flutter/material.dart';

class TicketsDetailScreen extends StatelessWidget {
  const TicketsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color(0xFF0b1028), // Nền màu tối
        elevation: 0, // Loại bỏ bóng
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icon back
          onPressed: () {
            Navigator.pop(context); // Quay về trang trước
          },
        ),
        title: const Text(
          'Ticket Details',
          style: TextStyle(
            color: Colors.white, // Màu chữ
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: Container(

      ),
    );
  }
}