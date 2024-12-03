import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected; // TODO: Biến để xác định trạng thái được chọn của item
  final String title; // TODO: Tiêu đề động hiển thị trong item

  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // TODO: Đặt chiều rộng cố định cho từng mục
      margin: const EdgeInsets.only(right: 16), // TODO: Khoảng cách giữa các mục
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [
                  Color.fromRGBO(0, 150, 255, 1.0),
                  Color.fromRGBO(0, 180, 255, 1.0),
                ],
              ) // TODO: Thêm gradient màu nếu mục được chọn
            : null, // FIXME: Không hiển thị gradient nếu mục không được chọn
        color: isSelected
            ? null
            : const Color(0xFF0b1028), // TODO: Màu nền mặc định cho mục không được chọn
        borderRadius: BorderRadius.circular(5), // TODO: Bo tròn các góc của mục
      ),
      child: Center(
        child: Text(
          title, // TODO: Hiển thị tiêu đề của từng mục
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey, // TODO: Đặt màu chữ tùy thuộc vào trạng thái
            fontSize: 16, // TODO: Kích thước chữ
            fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal, // TODO: Kiểu chữ in đậm nếu được chọn
          ),
        ),
      ),
    );
  }
}
