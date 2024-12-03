import 'package:flutter/material.dart';

class MovieSeatSelection extends StatefulWidget {
  final String title;

  const MovieSeatSelection({super.key, required this.title});

  @override
  _MovieSeatSelectionState createState() => _MovieSeatSelectionState();
}

class _MovieSeatSelectionState extends State<MovieSeatSelection> {
  List<int> selectedSeats = []; // Ghế đang được chọn
  final List<int> bookedSeats = [2, 10, 20, 30]; // Ghế đã được đặt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row trạng thái
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5), // Màu mờ cho ghế đã chọn
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Booked',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.blue, // Màu xanh nước biển cho ghế đang chọn
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Your Seat',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF35334A), // Màu nhạt cho ghế trống
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Available',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9, // 9 cột
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 54, // Tổng số ghế
                itemBuilder: (context, index) {
                  // Bỏ qua vị trí ô lối đi
                  if (index % 9 == 3 || index % 9 == 4) {
                    return const SizedBox.shrink();
                  }

                  // Trạng thái ghế
                  bool isBooked = bookedSeats.contains(index);
                  bool isSelected = selectedSeats.contains(index);

                  Color seatColor;
                  if (isBooked) {
                    seatColor = Color.fromRGBO(66, 71, 106, 1); // Ghế đã đặt
                  } else if (isSelected) {
                    seatColor = Colors.blue; // Ghế đang chọn
                  } else {
                    seatColor = const Color(0xFF35334A); // Ghế trống
                  }

                  return GestureDetector(
                    onTap: () {
                      if (!isBooked) {
                        setState(() {
                          if (isSelected) {
                            selectedSeats.remove(index);
                          } else {
                            selectedSeats.add(index);
                          }
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: seatColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'A${index + 1}',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Total Price Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2941),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price (${selectedSeats.length} Ticket)',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rp ${(selectedSeats.length * 50000).toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: selectedSeats.isEmpty ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Book Ticket',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
