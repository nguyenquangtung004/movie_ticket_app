import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  // TODO: Danh sách các ngày để hiển thị
  final List<String> dates;
  // TODO: Chỉ mục của ngày được chọn
  final int selectedDateIndex;
  // TODO: Hàm callback khi người dùng chọn ngày
  final Function(int) onDateSelected;

  const DateSelector({
    Key? key,
    required this.dates,
    required this.selectedDateIndex,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // TODO: Căn nội dung sang trái
      children: [
        // TODO: Tiêu đề cho bộ chọn ngày
        const Text(
          "Choose Date",
          style: TextStyle(
            color: Colors.white, // TODO: Đặt màu chữ
            fontSize: 18, // TODO: Kích thước chữ
            fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm
            decoration: TextDecoration.underline, // TODO: Gạch chân tiêu đề
          ),
        ),
        const SizedBox(height: 16), // TODO: Khoảng cách giữa tiêu đề và danh sách ngày
        SizedBox(
          height: 88, // TODO: Đặt chiều cao cố định cho danh sách ngày
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // TODO: Cuộn danh sách theo chiều ngang
            itemCount: dates.length, // FIXME: Đảm bảo số lượng ngày không vượt dữ liệu thực tế
            itemBuilder: (context, index) {
              final isPastDate = index < selectedDateIndex; // TODO: Kiểm tra nếu ngày đã qua
              return GestureDetector(
                onTap: () {
                  if (!isPastDate) onDateSelected(index); // FIXME: Không cho phép chọn ngày đã qua
                },
                child: Container(
                  height: 88, // TODO: Đặt chiều cao cho mỗi ô ngày
                  width: 70, // TODO: Đặt chiều rộng cho mỗi ô ngày
                  alignment: Alignment.center, // TODO: Căn giữa nội dung trong ô ngày
                  margin: const EdgeInsets.symmetric(horizontal: 8.0), // TODO: Khoảng cách giữa các ô ngày
                  decoration: BoxDecoration(
                    color: isPastDate
                        ? Colors.grey.withOpacity(0.3) // TODO: Màu cho ngày đã qua
                        : index == selectedDateIndex
                            ? Colors.blueAccent // TODO: Màu cho ngày được chọn
                            : Colors.white.withOpacity(0.1), // TODO: Màu mặc định cho ngày
                    borderRadius: BorderRadius.circular(12), // TODO: Bo góc ô ngày
                  ),
                  child: Text(
                    dates[index], // TODO: Hiển thị nội dung ngày
                    style: TextStyle(
                      color: isPastDate ? Colors.grey : Colors.white, // TODO: Màu chữ thay đổi theo trạng thái
                      fontSize: 16, // TODO: Kích thước chữ
                      fontWeight: FontWeight.bold, // TODO: Kiểu chữ đậm
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
