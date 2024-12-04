import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/booking_screen.dart';
import 'package:movie_ticket_app/View/movie_seat.dart';
import 'package:movie_ticket_app/View/oder_screen.dart';
import './Navigation/nav_bottom.dart'; // Nhập trình điều hướng phía dưới
import './Componets/header.dart';
import './Componets/search.dart';
import './Componets/category_item.dart';
import './Componets/slider_widget.dart';
import './Componets/card_item_promo.dart';
import './Componets/promo_card_2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0b1028),
        scaffoldBackgroundColor: const Color(0xFF0b1028),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0b1028),
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      // home: const BottomNavBar(), // TODO: Đặt màn hình chính là Thanh điều hướng phía dưới
      // FIXME: Bỏ chú thích nếu cần kiểm tra các màn hình cụ thể
      // home: BookingScreen(title: "Phim 1"),
      // home: MovieSeatSelection( title: "Phim 1",),
      home: OderScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const CustomBody(), // TODO: Thêm nội dung động cho phần thân
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  final List<String> items = [
    'Tất cả',
    'Drama',
    'Hài',
    'Kinh dị',
    'Lãng mạn',
    'Khoa học viễn tưởng',
    'Giả tưởng',
    'Ly kỳ',
    'Phiêu lưu',
    'Bí ẩn',
  ]; // TODO: Định nghĩa danh mục động nếu cần

  int selectedIndex = 0; // TODO: Triển khai chức năng chọn danh mục

  final List<Map<String, dynamic>> sliderData = [
    {
      "title": "Phim 1",
      "rate": 4.5,
      "image": "https://cdn.pixabay.com/photo/2020/04/20/18/10/cinema-5069314_1280.jpg",
    },
    {
      "title": "Phim 2",
      "rate": 4.0,
      "image": "https://cdn.pixabay.com/photo/2023/11/10/16/05/anime-8379662_640.jpg",
    },
    {
      "title": "Phim 3",
      "rate": 5.0,
      "image": "https://cdn.pixabay.com/photo/2020/08/27/18/49/people-5522679_640.jpg",
    },
    {
      "title": "Phim 4",
      "rate": 3.5,
      "image": "https://cdn.pixabay.com/photo/2017/08/02/00/07/people-2568887_640.jpg",
    },
  ]; // FIXME: Thay thế bằng dữ liệu lấy từ API nếu có

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                children: const [
                  SearchWidget(), // TODO: Triển khai chức năng tìm kiếm
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // TODO: Cập nhật trạng thái danh mục được chọn
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Đang chiếu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ), // TODO: Lấy danh sách phim đang chiếu từ API
            ),
            const SizedBox(height: 10),
            SliderWidget(sliderData: sliderData), // FIXME: Xử lý lỗi khi tải widget Slider
            const SizedBox(height: 16),
            const Text(
              "Sắp ra mắt",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ), // TODO: Lấy danh sách phim sắp ra mắt từ API
            ),
            const SizedBox(height: 10),
            HorizontalCards(), // TODO: Thay thế bằng danh sách phim động
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Khuyến mãi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ), // TODO: Thêm danh sách thẻ khuyến mãi động
                ),
                Text(
                  "Xem tất cả",
                  style: TextStyle(
                    color: Color.fromRGBO(52, 173, 252, 1),
                    decoration: TextDecoration.underline,
                  ), // FIXME: Triển khai điều hướng "Xem tất cả"
                ),
              ],
            ),
            VerticalCards(), // FIXME: Xử lý tải dữ liệu cho các thẻ dọc
          ],
        ),
      ),
    );
  }
}
