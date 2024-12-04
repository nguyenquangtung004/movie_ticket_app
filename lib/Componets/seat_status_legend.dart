import 'package:flutter/material.dart';

class SeatStatusLegend extends StatelessWidget {
  const SeatStatusLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem(Colors.grey.withOpacity(0.5), 'Booked'),
        _buildLegendItem(Colors.blue, 'Your Seat'),
        _buildLegendItem(const Color(0xFF35334A), 'Available'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
