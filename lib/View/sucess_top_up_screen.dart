import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/my_wallet_screen.dart';

class SucessTopUpScreen extends StatefulWidget {
  const SucessTopUpScreen({super.key});

  @override
  State<SucessTopUpScreen> createState() => _SucessTopUpScreenState();
}

class _SucessTopUpScreenState extends State<SucessTopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 50),
              child: ClipRRect(
                child: Image.asset(
                  'assets/suc_top_up.png',
                  width: 171,
                  height: 132,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Yummy!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'You have successfully \n top up the wallet',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 255,
              height: 61,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyWalletScreen(),
                          ),
                        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF4A90E2), // Màu xanh nước biển
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bo góc nút
                  ),
                ),
                child: const Text(
                  'My Wallet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/');
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Discover new movie? ',
                  children: [
                    TextSpan(
                        text: 'Back to home',
                        style: TextStyle(color: Colors.blue))
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
