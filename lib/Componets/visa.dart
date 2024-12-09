import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditableVisaCard extends StatelessWidget {
  const EditableVisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9, // Chiều rộng dựa trên kích thước màn hình
      height: 220, // Chiều cao cố định
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 16, 18, 188),
            Color.fromRGBO(97, 52, 137, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo và chữ TP BANK
            Row(
              children: [
                // Logo bên trái
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance, // Biểu tượng thay thế logo
                    size: 18,
                    color: Color.fromARGB(255, 16, 18, 188),
                  ),
                ),
                const SizedBox(width: 8),
                // Chữ TP Bank
                const Text(
                  "TP BANK",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Card Number
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 2,
              ),
              decoration: InputDecoration(
                hintText: "XXXX XXXX XXXX XXXX",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            // Valid From và Good Thru trên cùng dòng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      const Text(
                        "VALID\nFROM",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: "MM/YY",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Row(
                    children: [
                      const Text(
                        "GOOD\nTHRU",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: "MM/YY",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Tên chủ thẻ và logo hình chữ nhật
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "CARD HOLDER",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[A-Z\s]')), // Chỉ cho phép chữ hoa và khoảng trắng
                    ],
                    textCapitalization: TextCapitalization.characters, // Tự động chuyển sang chữ hoa
                  ),
                ),
                const SizedBox(width: 8),
                // Logo hình chữ nhật
                Container(
                  width: 100,
                  height: 50,
                  child: ClipRRect(
                    child: Image.asset('assets/visa.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
