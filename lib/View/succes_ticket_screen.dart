import 'package:flutter/gestures.dart'; // Import cần thiết để sử dụng TapGestureRecognizer
import 'package:flutter/material.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  const SuccessCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 85),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/logo_suc.png',
                  width: 276,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Happy Watching !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "You have successfully \n bought the ticket",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 72),
            SizedBox(
              width: 255,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Điều hướng tới màn hình My Ticket
                 Navigator.pushReplacementNamed(context, '/my_ticket');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "My Ticket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
  textAlign: TextAlign.center,
  text: TextSpan(
    children: [
      const TextSpan(
        text: "Discover new movie? ",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      TextSpan(
        text: "Back to home",
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
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
