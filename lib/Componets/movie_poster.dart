import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  // TODO: URL của ảnh poster
  final String imageUrl;
  // TODO: Chiều cao của poster
  final double height;

  const MoviePoster({
    Key? key,
    required this.imageUrl,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // TODO: Bo góc phần dưới của poster
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.network(
        imageUrl, // FIXME: Đảm bảo URL hợp lệ để tải ảnh
        width: double.infinity, // TODO: Đặt chiều rộng poster bằng toàn bộ màn hình
        height: height, // TODO: Chiều cao poster tùy chỉnh theo tham số
        fit: BoxFit.cover, // TODO: Đảm bảo ảnh lấp đầy toàn bộ khung
        errorBuilder: (context, error, stackTrace) {
          // FIXME: Xử lý khi không tải được ảnh
          return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: const Icon(
              Icons.error,
              color: Colors.white,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}
