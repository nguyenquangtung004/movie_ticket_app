import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    super.initState();
    selectedDateIndex = 0; // Mặc định chọn ngày hôm nay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Country
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

            // Choose Date
            const Text(
              "Choose Date",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 88,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final isPastDate = index < selectedDateIndex;
                  return GestureDetector(
                    onTap: () {
                      if (!isPastDate) {
                        setState(() {
                          selectedDateIndex = index;
                          selectedTime = ""; // Reset thời gian khi chọn ngày mới
                          selectedTheater = ""; // Reset rạp khi chọn ngày mới
                        });
                      }
                    },
                    child: Container(
                      height: 88,
                      width: 70,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: isPastDate
                            ? Colors.grey.withOpacity(0.3)
                            : index == selectedDateIndex
                                ? Colors.blueAccent
                                : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        dates[index],
                        style: TextStyle(
                          color: isPastDate ? Colors.grey : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Showtimes
            Expanded(
              child: ListView.builder(
                itemCount: showtimes.length,
                itemBuilder: (context, theaterIndex) {
                  final theater = showtimes[theaterIndex]['theater'] as String;
                  final times = showtimes[theaterIndex]['times'] as List<String>;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          theater,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: times.length,
                            itemBuilder: (context, timeIndex) {
                              final time = times[timeIndex];
                              final isPast = isTimePast(time);
                              final isSelected = selectedTime == time && selectedTheater == theater;
                              return GestureDetector(
                                onTap: () {
                                  if (!isPast) {
                                    selectTime(theater, time);
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isPast
                                        ? Colors.grey.withOpacity(0.3)
                                        : isSelected
                                            ? Colors.blueAccent
                                            : Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    time,
                                    style: TextStyle(
                                      color: isPast ? Colors.grey : Colors.white,
                                      fontSize: 14,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
