import 'package:flutter/material.dart';
import '../Componets/seat_status_legend.dart';
import '../Componets/seat_grid.dart';
import '../Componets/total_price_section.dart';

class MovieSeatSelection extends StatefulWidget {
  final String title;

  const MovieSeatSelection({super.key, required this.title});

  @override
  _MovieSeatSelectionState createState() => _MovieSeatSelectionState();
}

class _MovieSeatSelectionState extends State<MovieSeatSelection> {
  List<int> selectedSeats = [];
  final List<int> bookedSeats = [2, 10, 20, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
        elevation: 0,
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white,fontSize: 25),
              
            ),
            Text(
              "FX Sudirman XXI",
              style: const TextStyle(color: Colors.white,fontSize: 14),
              
            ),
            const SeatStatusLegend(), // Sử dụng widget trạng thái ghế
            const SizedBox(height: 16),
            Expanded(
              child: SeatGrid(
                selectedSeats: selectedSeats,
                bookedSeats: bookedSeats,
                onSeatTap: (index) {
                  setState(() {
                    if (selectedSeats.contains(index)) {
                      selectedSeats.remove(index);
                    } else {
                      selectedSeats.add(index);
                    }
                  });
                },
              ),
            ),

             Center(
               child: Image.network(
                "https://i.postimg.cc/4d7D9b5t/tivi.png",
                width: 250,
                height: 150,
                
                
                           ),
             ),
            const SizedBox(height: 16),
            TotalPriceSection(
              selectedSeatsCount: selectedSeats.length,
              onBookTicket: () {
                // TODO: Xử lý sự kiện đặt vé
              },
            ),
            const SizedBox(height: 10,),
           
          ],
        ),
      ),
    );
  }
}
