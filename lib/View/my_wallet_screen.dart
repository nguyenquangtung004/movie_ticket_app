import 'package:flutter/material.dart';
import 'package:movie_ticket_app/Componets/visa.dart';
// import 'package:movie_ticket_app/View/top_up_empty.dart';
import 'package:movie_ticket_app/View/top_up_screen.dart'; // Nhập màn hình TopUpEmpty

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  // Fake data
  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Ralph Breaks the Internet",
      "amount": "IDR 150.000",
      "time": "16:40, Sun May 22",
      "image": "https://i.pinimg.com/236x/05/23/32/05233269a67c6fc20fd3d549edc928ff.jpg",
    },
    {
      "title": "Spider-Man: No Way Home",
      "amount": "IDR 200.000",
      "time": "19:30, Fri May 20",
      "image": "https://i.pinimg.com/236x/ac/cf/70/accf70350a52720143f35d7348bad913.jpg",
    },
    {
      "title": "The Batman",
      "amount": "IDR 180.000",
      "time": "14:20, Wed May 18",
      "image": "https://i.pinimg.com/236x/78/17/49/781749adeacb18bfb68893e658503e4e.jpg",
    },
    {
      "title": "Frozen II",
      "amount": "IDR 150.000",
      "time": "11:00, Mon May 16",
      "image": "https://i.pinimg.com/236x/68/3a/98/683a980c96a1b1d1887816cf294d3dc0.jpg",
    },
    {
      "title": "Avatar: The Way of Water",
      "amount": "IDR 220.000",
      "time": "20:15, Sat May 14",
      "image": "https://i.pinimg.com/236x/64/94/b8/6494b8c06cf9e211da578ee683ebcfc4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wallet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0b1028),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0b1028),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              const Center(child: EditableVisaCard()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Recent Transactions",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return GestureDetector(
                      onTap: () {
                        // Điều hướng đến màn hình TopUpEmpty
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopUpEmpty(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                transaction['image'],
                                width: 84,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction['title'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    transaction['amount'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    transaction['time'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                // Hành động khi nhấn nút
                print("Floating Action Button Pressed");
              },
              shape: const CircleBorder(),
              child: const Icon(
                Icons.download_for_offline_sharp,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
