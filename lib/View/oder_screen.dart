import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/succes_ticket_screen.dart';

class OderScreen extends StatefulWidget {
  const OderScreen({super.key});

  @override
  State<OderScreen> createState() => _OderScreenState();
}

class _OderScreenState extends State<OderScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: Thanh tiêu đề
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(11, 15, 47, 1),
        title: //TODO: Tiêu Đề Màn Hình
            Center(
          child: const Text(
            "Checkout \n  Movie",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TODO: Ảnh bên trái và các text bên phải
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TODO: Ảnh bên trái
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://th.bing.com/th/id/OIP.zF6XTi4MTlCygr61tUlFegHaJf?w=139&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                      height: 120,
                      width: 84,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 24),
                  // TODO: Văn bản và ngôi sao bên phải
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Movie 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              return const Icon(
                                Icons.star_rate,
                                color: Colors.amber,
                                size: 16,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Action & adventure, Comedy \n1h 41min",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //TODO: Thanh Divider
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 5), // Cách trái và phải 5px
                child: Divider(
                  color: Colors.grey, // Màu sắc của Divider
                  thickness: 1, // Độ dày của Divider
                  height:
                      20, // Khoảng cách chiều cao giữa các phần tử và Divider
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID Order",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "22081996",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cinema",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "FX Sudirman XXI",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date & Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Sun May 22,  16:40",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seat Number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "D7,D8,D9",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Rp 50.000 x 3",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Rp 150.000",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              //TODO: Thanh Divider
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 5), // Cách trái và phải 5px
                child: Divider(
                  color: Colors.grey, // Màu sắc của Divider
                  thickness: 1, // Độ dày của Divider
                  height:
                      20, // Khoảng cách chiều cao giữa các phần tử và Divider
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Wallet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "IDR 200.000",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(61, 88, 248, 1)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 56),
                child: SizedBox(
                  width: 255,
                  height: 61,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Xử lý sự kiện bấm nút
                      // print("Checkout button pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> const SuccessCheckoutScreen()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(61, 88, 248, 1), // Màu nền của nút
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bo góc nút
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Kích thước nút
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontSize: 16, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Độ đậm của chữ
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
