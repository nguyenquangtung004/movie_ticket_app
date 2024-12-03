import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60, // TODO: Đặt chiều cao cho hộp tìm kiếm
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 27, 50, 1.0), // TODO: Đặt màu nền cho hộp tìm kiếm
          borderRadius: BorderRadius.circular(22), // TODO: Bo tròn các góc
        ),
        child: Row(
          children: [
            // TODO: Hiển thị biểu tượng tìm kiếm
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8), // FIXME: Điều chỉnh khoảng cách giữa biểu tượng và TextField nếu cần
            // TODO: Thêm TextField để người dùng nhập nội dung tìm kiếm
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm phim', // TODO: Đặt gợi ý văn bản cho ô tìm kiếm
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600, // TODO: Đặt màu chữ gợi ý
                  ),
                  border: InputBorder.none, // FIXME: Xóa đường viền TextField nếu không cần thiết
                ),
                style: const TextStyle(
                  color: Colors.black, // FIXME: Điều chỉnh màu chữ nếu không tương phản tốt
                  fontSize: 16, // TODO: Đặt kích thước chữ
                ),
              ),
            ),
            // TODO: Thêm nút hành động bên cạnh ô tìm kiếm
            Container(
              width: 50,
              height: 50, // TODO: Đặt kích thước cho nút
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 73, 173, 255), // TODO: Đặt gradient màu
                    Color.fromRGBO(98, 179, 246, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(14), // TODO: Bo tròn các góc nút
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.settings_input_composite_outlined,
                  color: Colors.white, // TODO: Đặt màu biểu tượng
                ),
                onPressed: () {
                  // TODO: Thêm hành động cho nút khi được nhấn
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
