import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket_app/View/sucess_top_up_screen.dart';

class TopUpEmpty extends StatefulWidget {
  const TopUpEmpty({super.key});

  @override
  State<TopUpEmpty> createState() => _TopUpEmptyState();
}

class _TopUpEmptyState extends State<TopUpEmpty> {
  final List<String> gridItems = [
    "50.000",
    "100.000",
    "150.000",
    "200.000",
    "250.000",
    "500.000",
    "750.000",
    "1.000.000",
  ];

  int? selectedIndex;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 50),
            child: const Text("Top Up"),
          ),
        ),
        backgroundColor: const Color(0xFF0b1028),
      ),
      backgroundColor: const Color(0xFF0b1028),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextFormField(
              controller: amountController,
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: const TextStyle(
                  color: Color(0xFF4A90E2),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Enter Amount",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF4A90E2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    amountController.text = '';
                  } else {
                    final formattedValue = "IDR ${int.parse(value)}";
                    amountController.value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                          offset: formattedValue.length),
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: gridItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 154 / 90,
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        amountController.text = "IDR ${gridItems[index]}";
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blueAccent
                            : const Color(0xFF1C1F3E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "IDR\n",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: gridItems[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: amountController.text.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SucessTopUpScreen(),
                          ),
                        );
                          print("Amount entered: ${amountController.text}");
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amountController.text.isEmpty
                        ? const Color.fromARGB(126, 93, 120, 174)
                        : const Color(0xFF4A90E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const SizedBox(
                    width: 255,
                    height: 61,
                    child: Center(
                      child: Text(
                        'Top Up Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
