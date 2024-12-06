import 'package:flutter/material.dart';

class TicketsDetailScreen extends StatelessWidget {
  const TicketsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng của màn hình
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0b1028), // Nền màu tối
        elevation: 0, // Loại bỏ bóng
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icon back
          onPressed: () {
            Navigator.pop(context); // Quay về trang trước
          },
        ),
        title: const Text(
          'Ticket Details',
          style: TextStyle(
            color: Colors.white, // Màu chữ
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://i.pinimg.com/236x/67/78/32/6778329095937b7f6c5c9ee383460390.jpg',
                        width: 84,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      // Giới hạn chiều rộng của văn bản bằng cách trừ đi chiều rộng ảnh và margin
                      width: screenWidth - 84 - 20 - 48, // 48 = padding của `Row` (24 x 2)
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ralph Breaks the Internet",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.yellow, // Màu vàng cho sao
                                size: 20, // Kích thước của mỗi ngôi sao
                              );
                            }),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Action & adventure, Comedy \n1h 41min',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const DividerDashed(), // Đường gạch nét đứt
              _buildDetailRow('Cinema', 'FX Sudirman XXI'),
              // const DividerDashed(),
              _buildDetailRow('Date & Time', 'Sun May 22,  16:40'),
              // const DividerDashed(),
              _buildDetailRow('Seat Number', 'D7, D8, D9'),
              // const DividerDashed(),
              _buildDetailRow('Paid', 'IDR 150.000'),
              SizedBox(height: 27,),
              const DividerDashed(),
              Container(
                margin: EdgeInsets.only(top: 13),
                child: ClipRRect(
                  child: Image.asset('assets/Barcode.png',width: 199,height: 199,),
                ),
              ),
              SizedBox(height: 8,),
              Text('ID Order',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              Text('22081996',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

// Widget tạo đường gạch nét đứt
class DividerDashed extends StatelessWidget {
  const DividerDashed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(),
      size: const Size(double.infinity, 1),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
