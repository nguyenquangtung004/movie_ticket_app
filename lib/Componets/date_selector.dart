import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final List<String> dates;
  final int selectedDateIndex;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  if (!isPastDate) onDateSelected(index);
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
      ],
    );
  }
}
