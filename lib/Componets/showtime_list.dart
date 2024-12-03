import 'package:flutter/material.dart';

class ShowtimeList extends StatelessWidget {
  // TODO: Danh sách các suất chiếu, truyền từ bên ngoài
  final List<Map<String, dynamic>> showtimes;
  // TODO: Nhà hát được chọn
  final String selectedTheater;
  // TODO: Thời gian được chọn
  final String selectedTime;
  // TODO: Hàm callback khi chọn thời gian
  final void Function(String, String) onTimeSelected;
  // TODO: Hàm kiểm tra xem thời gian đã qua hay chưa
  final bool Function(String) isTimePast;

  const ShowtimeList({
    Key? key,
    required this.showtimes,
    required this.selectedTheater,
    required this.selectedTime,
    required this.onTimeSelected,
    required this.isTimePast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: showtimes.length, // TODO: Số lượng nhà hát
      itemBuilder: (context, theaterIndex) {
        final theater = showtimes[theaterIndex]['theater'] as String; // TODO: Lấy tên nhà hát
        final times = showtimes[theaterIndex]['times'] as List<String>; // TODO: Lấy danh sách thời gian chiếu
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0), // TODO: Khoảng cách giữa các nhóm nhà hát
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // TODO: Căn nội dung sang trái
            children: [
              // TODO: Hiển thị tên nhà hát
              Text(
                theater,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // TODO: Khoảng cách giữa tên nhà hát và danh sách thời gian
              SizedBox(
                height: 50, // TODO: Đặt chiều cao cho danh sách thời gian
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // TODO: Kéo ngang danh sách thời gian
                  itemCount: times.length, // FIXME: Đảm bảo số lượng thời gian không vượt dữ liệu
                  itemBuilder: (context, timeIndex) {
                    final time = times[timeIndex]; // TODO: Lấy thời gian từng mục
                    final isPast = isTimePast(time); // TODO: Kiểm tra nếu thời gian đã qua
                    final isSelected =
                        selectedTime == time && selectedTheater == theater; // TODO: Kiểm tra nếu thời gian được chọn
                    return GestureDetector(
                      onTap: () {
                        if (!isPast) onTimeSelected(theater, time); // FIXME: Không cho phép chọn thời gian đã qua
                      },
                      child: Container(
                        alignment: Alignment.center, // TODO: Căn giữa nội dung trong container
                        margin: const EdgeInsets.only(right: 12), // TODO: Khoảng cách giữa các thời gian
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ), // TODO: Khoảng cách bên trong container
                        decoration: BoxDecoration(
                          color: isPast
                              ? Colors.grey.withOpacity(0.3) // TODO: Màu cho thời gian đã qua
                              : isSelected
                                  ? Colors.blueAccent // TODO: Màu cho thời gian được chọn
                                  : Colors.white.withOpacity(0.1), // TODO: Màu mặc định
                          borderRadius: BorderRadius.circular(8), // TODO: Bo góc container
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: isPast ? Colors.grey : Colors.white, // TODO: Màu chữ thay đổi theo trạng thái
                            fontSize: 14, // TODO: Kích thước chữ
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
