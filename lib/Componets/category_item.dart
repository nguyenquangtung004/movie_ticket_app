import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String title;

  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Chiều rộng từng item
      margin: const EdgeInsets.only(right: 16), // Khoảng cách giữa các item
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [
                  Color.fromRGBO(0, 150, 255, 1.0),
                  Color.fromRGBO(0, 180, 255, 1.0),
                ],
              )
            : null, // Không gradient nếu không được chọn
        color: isSelected
            ? null
            : const Color(0xFF0b1028), // Màu nền giống background
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          title, // Text động từ danh sách
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
