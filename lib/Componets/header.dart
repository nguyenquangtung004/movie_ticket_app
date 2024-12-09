import 'package:flutter/material.dart';

// TODO: Tạo CustomAppBar Widget để tùy chỉnh AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0b1028), // TODO: Đặt màu nền của AppBar
      title: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // TODO: Căn đều khoảng cách giữa các phần tử
          crossAxisAlignment: CrossAxisAlignment.center, // TODO: Căn giữa dọc
          children: [
            // TODO: Thêm tiêu đề chính cho AppBar
            const Padding(
              padding: EdgeInsets.only(
                top: 13.0,
                bottom: 13.0,
                left: 15.0,
              ), // FIXME: Kiểm tra và điều chỉnh khoảng cách nếu cần
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Find Your Best \n", // TODO: Dòng đầu tiên của tiêu đề
                      style: TextStyle(
                        fontSize: 25, // FIXME: Kiểm tra kích thước chữ có phù hợp không
                      ),
                    ),
                    TextSpan(
                      text: "Movie ", // TODO: Dòng thứ hai của tiêu đề
                      style: TextStyle(
                        fontSize: 25, // FIXME: Điều chỉnh nếu kích thước chữ không đồng nhất
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Colors.white, // TODO: Đặt màu chữ là trắng
                ),
              ),
            ),
            // TODO: Thêm ảnh đại diện bên phải AppBar
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: ClipOval(
                child: Image.network(
                  "https://i.pinimg.com/236x/73/ae/e3/73aee3ea228873a5368ff46b67e5aab3.jpg",
                  width: 50, // TODO: Đặt chiều rộng của ảnh đại diện
                  height: 50, // TODO: Đặt chiều cao của ảnh đại diện
                  fit: BoxFit.cover, // FIXME: Đảm bảo ảnh được cắt và hiển thị vừa khung
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(73.0); // TODO: Đặt chiều cao cố định cho AppBar
}
