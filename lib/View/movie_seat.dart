import 'package:flutter/material.dart';

class MovieSeatSelection extends StatefulWidget {
  @override
  _MovieSeatSelectionState createState() => _MovieSeatSelectionState();
}

class _MovieSeatSelectionState extends State<MovieSeatSelection> {
  List<bool> selectedSeats = List.generate(60, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1B2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1B2E),
        elevation: 0,
        title: Text(
          'Ralph Breaks the Internet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              'FX Sudirman XXI',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9, // 9 cột tổng, bao gồm 2 ô trống làm lối đi
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 54,
                itemBuilder: (context, index) {
                  // Bỏ qua vị trí ô lối đi
                  if (index % 9 == 3 || index % 9 == 4) {
                    return SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSeats[index] = !selectedSeats[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedSeats[index]
                            ? Color(0xFF8C67AC)
                            : Color(0xFF35334A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'A${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2A2941),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price ( ${selectedSeats.where((seat) => seat).length} Ticket)',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rp ${(selectedSeats.where((seat) => seat).length * 50000).toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8C67AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
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
