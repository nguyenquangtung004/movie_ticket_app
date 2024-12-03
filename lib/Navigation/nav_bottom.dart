import 'package:flutter/material.dart';
import 'package:movie_ticket_app/main.dart'; // TODO: Import màn hình chính từ main.dart

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // TODO: Chỉ mục được chọn trong thanh điều hướng

  // TODO: Danh sách các màn hình
  final List<Widget> _screens = [
    const HomeScreen(),
    const WalletScreen(),
    const MyTicketsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // FIXME: Đảm bảo chỉ mục không vượt danh sách
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // TODO: Chỉ mục hiện tại
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // TODO: Cập nhật chỉ mục khi người dùng chọn
          });
        },
        items: const [
          // TODO: Các mục trong thanh điều hướng
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // TODO: Biểu tượng cho mục "Home"
            label: 'Home', // TODO: Nhãn cho mục "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), // TODO: Biểu tượng cho mục "Wallet"
            label: 'Wallet', // TODO: Nhãn cho mục "Wallet"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie), // TODO: Biểu tượng cho mục "My Tickets"
            label: 'My Tickets', // TODO: Nhãn cho mục "My Tickets"
          ),
        ],
        backgroundColor: const Color(0xFF0b1028), // TODO: Màu nền của thanh điều hướng
        selectedItemColor: const Color.fromARGB(255, 73, 173, 255), // TODO: Màu cho mục được chọn
        unselectedItemColor: Colors.grey, // TODO: Màu cho mục không được chọn
      ),
    );
  }
}

// TODO: Màn hình ví
class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"), // TODO: Tiêu đề của màn hình ví
      ),
      body: const Center(
        child: Text(
          "Wallet Screen", // TODO: Nội dung màn hình ví
          style: TextStyle(color: Colors.white, fontSize: 24), // TODO: Kiểu chữ và màu sắc
        ),
      ),
    );
  }
}

// TODO: Màn hình vé của tôi
class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tickets"), // TODO: Tiêu đề của màn hình vé
      ),
      body: const Center(
        child: Text(
          "My Tickets Screen", // TODO: Nội dung màn hình vé
          style: TextStyle(color: Colors.white, fontSize: 24), // TODO: Kiểu chữ và màu sắc
        ),
      ),
    );
  }
}
