import 'package:flutter/material.dart';

class ShowtimeList extends StatelessWidget {
  final List<Map<String, dynamic>> showtimes;
  final String selectedTheater;
  final String selectedTime;
  final void Function(String, String) onTimeSelected;
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
                        if (!isPast) onTimeSelected(theater, time);
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
    );
  }
}
