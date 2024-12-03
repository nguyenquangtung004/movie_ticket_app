import 'package:flutter/material.dart';

class VerticalCards extends StatelessWidget {
  // TODO: Danh sách dữ liệu cho các thẻ, có thể thay bằng dữ liệu từ API trong tương lai
  final List<Map<String, String>> cardData = [
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
    {
      "title": "Student Holiday",
      "description": "Maximal only for two people.",
      "info": "OFF 50%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // TODO: Căn nội dung các thẻ sang trái
        children: List.generate(cardData.length, (index) {
          final card = cardData[index]; // TODO: Lấy dữ liệu của từng thẻ
          return Container(
            width: 384, // TODO: Đặt chiều rộng cố định cho thẻ
            height: 84, // TODO: Đặt chiều cao cố định cho thẻ
            margin: const EdgeInsets.only(bottom: 10), // TODO: Đặt khoảng cách giữa các thẻ
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(61, 90, 249, 1),
                  Color.fromRGBO(112, 131, 250, 1),
                ],
                begin: Alignment.topLeft, // TODO: Gradient bắt đầu từ góc trên trái
                end: Alignment.bottomRight, // TODO: Gradient kết thúc ở góc dưới phải
              ),
              borderRadius: BorderRadius.circular(12), // TODO: Bo góc các thẻ
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // TODO: Tạo bóng cho thẻ
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12), // TODO: Khoảng cách nội dung bên trong thẻ
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // TODO: Căn đều các cột
                children: [
                  // TODO: Cột trái hiển thị tiêu đề và mô tả
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, // TODO: Căn giữa nội dung trong cột
                      children: [
                        Text(
                          card["title"]!, // FIXME: Đảm bảo key "title" luôn tồn tại
                          style: const TextStyle(
                            color: Colors.white, // TODO: Đặt màu chữ cho tiêu đề
                            fontSize: 14, // TODO: Kích thước chữ tiêu đề
                            fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm cho tiêu đề
                          ),
                        ),
                        Text(
                          card["description"]!, // FIXME: Đảm bảo key "description" luôn tồn tại
                          style: const TextStyle(
                            color: Colors.white70, // TODO: Đặt màu chữ nhạt cho mô tả
                            fontSize: 9, // TODO: Kích thước chữ cho mô tả
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TODO: Cột phải hiển thị thông tin giảm giá
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight, // TODO: Căn phải nội dung
                      child: Text(
                        card["info"]!, // FIXME: Đảm bảo key "info" luôn tồn tại
                        style: const TextStyle(
                          color: Colors.white, // TODO: Đặt màu chữ cho thông tin
                          fontSize: 14, // TODO: Kích thước chữ cho thông tin
                          fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm cho thông tin
                        ),
                        textAlign: TextAlign.right, // TODO: Căn phải văn bản
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
