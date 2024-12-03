import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Componets/date_selector.dart';
import '../Componets/showtime_list.dart';
import '../View/movie_seat.dart'; // Import màn hình chọn ghế

class BookingScreen extends StatefulWidget {
  final String title;

  const BookingScreen({Key? key, required this.title}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedDateIndex = 0; // Ngày được chọn mặc định
  String selectedTime = ""; // Giờ được chọn
  String selectedTheater = ""; // Rạp được chọn
  final DateTime now = DateTime.now();

  final List<String> dates = [
    DateFormat('EEE d').format(DateTime.now()),
    DateFormat('EEE d').format(DateTime.now().add(Duration(days: 1))),
    DateFormat('EEE d').format(DateTime.now().add(Duration(days: 2))),
    DateFormat('EEE d').format(DateTime.now().add(Duration(days: 3))),
  ];

  final List<Map<String, dynamic>> showtimes = [
    {'theater': 'Central Park CGV', 'times': ['12:20', '14:30', '16:40', '17:30', '18:40', '19:30']},
    {'theater': 'FX Sudirman XXI', 'times': ['12:20', '14:30', '16:40', '17:30', '18:40', '19:30']},
    {'theater': 'Kelapa Gading IMAX', 'times': ['12:20', '14:30', '16:40', '17:30', '18:40', '19:30']},
    {'theater': 'Epicentrum XXI', 'times': ['13:00', '15:30', '18:00', '20:30']},
  ];

  bool isTimePast(String time) {
    if (selectedDateIndex != 0) return false; // Chỉ kiểm tra thời gian nếu là hôm nay
    final currentTime = DateTime.now();
    final parsedTime = DateFormat('HH:mm').parse(time);
    final selectedTime = DateTime(currentTime.year, currentTime.month, currentTime.day, parsedTime.hour, parsedTime.minute);
    return selectedTime.isBefore(currentTime);
  }

  void selectTime(String theater, String time) {
    setState(() {
      selectedTime = time;
      selectedTheater = theater;
    });
  }

  void navigateToNextScreen() {
    if (selectedTheater.isNotEmpty && selectedTime.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieSeatSelection(
           
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Select Country Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0b1028),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white70),
                        const Expanded(
                          child: Text(
                            "Select Your Country",
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.white70),
                      ],
                    ),
                  ),
                ),
                // Date Selector
                DateSelector(
                  dates: dates,
                  selectedDateIndex: selectedDateIndex,
                  onDateSelected: (index) {
                    setState(() {
                      selectedDateIndex = index;
                      selectedTime = "";
                      selectedTheater = "";
                    });
                  },
                ),
                const SizedBox(height: 24),
                // Showtime List
                Expanded(
                  child: ShowtimeList(
                    showtimes: showtimes,
                    selectedTheater: selectedTheater,
                    selectedTime: selectedTime,
                    isTimePast: isTimePast,
                    onTimeSelected: selectTime,
                  ),
                ),
              ],
            ),
          ),
          // Nút Next hình tròn
          if (selectedTheater.isNotEmpty && selectedTime.isNotEmpty)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: navigateToNextScreen,
                backgroundColor: Colors.blueAccent,
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
