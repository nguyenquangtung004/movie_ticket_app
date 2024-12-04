import 'package:flutter/material.dart';

class SeatGrid extends StatelessWidget {
  final List<int> selectedSeats;
  final List<int> bookedSeats;
  final Function(int) onSeatTap;

  const SeatGrid({
    Key? key,
    required this.selectedSeats,
    required this.bookedSeats,
    required this.onSeatTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9, // 9 cột
        crossAxisSpacing: 10, // Khoảng cách giữa các cột
        mainAxisSpacing: 10, // Khoảng cách giữa các hàng
      ),
      itemCount: 80, // Tổng số ghế
      itemBuilder: (context, index) {
        // Lối đi (chỉ số 3 và 4 trong mỗi hàng)
        if (index % 9 == 3 || index % 9 == 4) {
          return const SizedBox(
            width: 10,
            
          );
        }

        // Xác định trạng thái ghế
        final bool isBooked = bookedSeats.contains(index);
        final bool isSelected = selectedSeats.contains(index);

        final Color seatColor = isBooked
            ? const Color.fromRGBO(66, 71, 106, 1) // Màu cho ghế đã đặt
            : isSelected
                ? Colors.blue // Màu cho ghế được chọn
                : const Color(0xFF35334A); // Màu cho ghế trống

        return GestureDetector(
          onTap: () {
            if (!isBooked) onSeatTap(index); // Chỉ cho phép chọn ghế trống
          },
          child: Container(
            width: 36, // Chiều rộng ghế
            height: 36, // Chiều cao ghế
            decoration: BoxDecoration(
              color: seatColor,
              borderRadius: BorderRadius.circular(8), // Bo góc ghế
            ),
            child: Center(
              child: Text(
                'A${index + 1}', // Số ghế
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        );
      },
    );
  }
}
