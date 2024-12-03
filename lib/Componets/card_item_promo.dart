import 'package:flutter/material.dart';
import '../View/information_screen.dart'; // TODO: Đảm bảo đường dẫn đúng đến màn hình chi tiết phim

class HorizontalCards extends StatelessWidget {
  // TODO: Dữ liệu cho các thẻ ngang, có thể thay bằng API trong tương lai
  final List<Map<String, String>> cardData = [
    {
      "title": "Movie 1",
      "image": "https://i.pinimg.com/236x/b2/69/a0/b269a0783b22d878eae90b18a2642c41.jpg",
    },
    {
      "title": "Movie 2",
      "image": "https://i.pinimg.com/474x/df/03/37/df03378d92dc04f926c21e58a0a7a705.jpg",
    },
    {
      "title": "Movie 3",
      "image": "https://i.pinimg.com/236x/7d/76/d4/7d76d4a0e685c96bcb57e50fe7a86f78.jpg",
    },
    {
      "title": "Movie 4",
      "image": "https://i.pinimg.com/236x/b0/90/e7/b090e708d72e6d5da49d7d63bf6433be.jpg",
    },
    {
      "title": "Movie 5",
      "image": "https://i.pinimg.com/236x/ab/00/4a/ab004abc2eedce7236fa09389a9c02c0.jpg",
    },
    {
      "title": "Movie 6",
      "image": "https://i.pinimg.com/236x/39/cf/0a/39cf0a94b7c5737ef2c02deb47499454.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 147, // TODO: Đặt chiều cao cho danh sách thẻ
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // TODO: Kéo ngang danh sách các thẻ
        itemCount: cardData.length, // FIXME: Đảm bảo số lượng thẻ không vượt quá dữ liệu thực tế
        itemBuilder: (context, index) {
          final data = cardData[index]; // TODO: Lấy dữ liệu của từng thẻ
          return GestureDetector(
            onTap: () {
              // TODO: Điều hướng đến màn hình chi tiết phim khi nhấn vào thẻ
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Movie(
                    title: data["title"]!, // FIXME: Đảm bảo dữ liệu "title" luôn tồn tại
                    imageUrl: data["image"]!, // FIXME: Đảm bảo dữ liệu "image" luôn tồn tại
                  ),
                ),
              );
            },
            child: Container(
              width: 103, // TODO: Đặt chiều rộng của từng thẻ
              margin: const EdgeInsets.symmetric(horizontal: 8), // TODO: Đặt khoảng cách giữa các thẻ
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // TODO: Bo góc cho thẻ
                color: Colors.grey[800], // TODO: Đặt màu nền cho thẻ
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // TODO: Đặt bóng cho thẻ
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // TODO: Căn giữa nội dung trong thẻ
                children: [
                  // TODO: Hiển thị ảnh trong thẻ
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8), // TODO: Bo góc cho ảnh
                    child: Image.network(
                      data["image"]!,
                      width: 103,
                      height: 120,
                      fit: BoxFit.cover, // FIXME: Đảm bảo ảnh luôn hiển thị đầy đủ trong khung
                    ),
                  ),
                  const SizedBox(height: 4), // TODO: Thêm khoảng cách giữa ảnh và tiêu đề
                  // TODO: Hiển thị tiêu đề phim
                  Text(
                    data["title"]!,
                    style: const TextStyle(
                      color: Colors.white, // TODO: Đặt màu chữ là trắng
                      fontSize: 12, // TODO: Đặt kích thước chữ
                      fontWeight: FontWeight.bold, // TODO: Đặt kiểu chữ đậm
                    ),
                    textAlign: TextAlign.center, // TODO: Căn giữa tiêu đề
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
