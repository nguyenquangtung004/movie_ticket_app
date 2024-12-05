import 'package:flutter/material.dart';

class UserProfilingScreen extends StatefulWidget {
  const UserProfilingScreen({super.key});

  @override
  State<UserProfilingScreen> createState() => _UserProfilingScreenState();
}

class _UserProfilingScreenState extends State<UserProfilingScreen> {
  // Danh sách các ô chọn
  final List<String> genres = [
    "Horror",
    "Action",
    "Drama",
    "War",
    "Comedy",
    "Crime"
  ];
  final List<String> language = [
    "Bahasa",
    "English",
    "Japanese",
    "Korean",
  ];

  // Danh sách lưu trạng thái chọn của mỗi nhóm
  final List<bool> selectedGenres = List.filled(6, false);
  final List<bool> selectedLanguages = List.filled(4, false);

  bool get isNextEnabled {
    return selectedGenres.contains(true) && selectedLanguages.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0b1028), // Màu nền AppBar
        elevation: 0, // Loại bỏ bóng của AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Biểu tượng mũi tên
          onPressed: () {
            Navigator.pop(context); // Quay về màn hình trước
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Your \nFavorite Genre",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // GridView cho nhóm thể loại
              GridView.builder(
                shrinkWrap: true, // Hạn chế độ cao của GridView
                physics:
                    const NeverScrollableScrollPhysics(), // Không cuộn riêng
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 ô mỗi hàng
                  crossAxisSpacing: 16, // Khoảng cách ngang giữa các ô
                  mainAxisSpacing: 16, // Khoảng cách dọc giữa các ô
                  childAspectRatio: 2.1, // Tỷ lệ giữa chiều rộng và chiều cao
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenres[index] =
                            !selectedGenres[index]; // Đổi trạng thái chọn
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedGenres[index]
                            ? const Color(0xFF4A90E2) // Màu khi được chọn
                            : const Color(0xFF1C1F3E), // Màu mặc định
                        borderRadius: BorderRadius.circular(12), // Bo góc
                      ),
                      child: Text(
                        genres[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              const Text(
                "Select Your \nFavorite Language",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // GridView cho nhóm ngôn ngữ
              GridView.builder(
                shrinkWrap: true, // Hạn chế độ cao của GridView
                physics:
                    const NeverScrollableScrollPhysics(), // Không cuộn riêng
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 ô mỗi hàng
                  crossAxisSpacing: 16, // Khoảng cách ngang giữa các ô
                  mainAxisSpacing: 16, // Khoảng cách dọc giữa các ô
                  childAspectRatio: 2.1, // Tỷ lệ giữa chiều rộng và chiều cao
                ),
                itemCount: language.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguages[index] =
                            !selectedLanguages[index]; // Đổi trạng thái chọn
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedLanguages[index]
                            ? const Color(0xFF4A90E2) // Màu khi được chọn
                            : const Color(0xFF1C1F3E), // Màu mặc định
                        borderRadius: BorderRadius.circular(12), // Bo góc
                      ),
                      child: Text(
                        language[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isNextEnabled
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF4A90E2),
              onPressed: () {
                // Chuyển sang màn hình mới
                Navigator.pushReplacementNamed(context, '/confirmation_pro');
              },
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            )
          : null, // Ẩn nút nếu không đủ điều kiện
    );
  }
}

