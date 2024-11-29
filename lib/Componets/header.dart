import 'package:flutter/material.dart';

// CustomAppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0b1028), // Màu nền của AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa dọc
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13.0, bottom: 13.0,left: 15.0), // Khoảng cách trên và dưới
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Find Your Best\n", // Dòng đầu tiên
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  TextSpan(
                    text: "Movie", // Dòng thứ hai
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ClipOval(
            child: Image.network(
              "https://i.pinimg.com/236x/73/ae/e3/73aee3ea228873a5368ff46b67e5aab3.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0); // Chiều cao AppBar
}
