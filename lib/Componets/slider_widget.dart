import 'dart:async';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  // TODO: Dữ liệu cho slider, truyền vào từ bên ngoài
  final List<Map<String, dynamic>> sliderData;

  const SliderWidget({Key? key, required this.sliderData}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.8); // TODO: Điều khiển trang với chế độ xem phân đoạn
  late Timer _timer; // TODO: Tự động thay đổi trang sau một khoảng thời gian

  @override
  void initState() {
    super.initState();
    _startAutoSlide(); // TODO: Bắt đầu tự động cuộn slider
  }

  @override
  void dispose() {
    _timer.cancel(); // FIXME: Hủy Timer khi widget bị hủy để tránh rò rỉ tài nguyên
    _pageController.dispose(); // FIXME: Hủy PageController để giải phóng bộ nhớ
    super.dispose();
  }

  void _startAutoSlide() {
    // TODO: Định kỳ cuộn trang sau mỗi 3 giây
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == widget.sliderData.length - 1) {
        // FIXME: Nếu đang ở trang cuối, quay lại trang đầu
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // TODO: Cuộn đến trang tiếp theo
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // TODO: Đặt chiều cao cố định cho slider
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.sliderData.length, // FIXME: Đảm bảo số lượng trang không vượt dữ liệu
        itemBuilder: (context, index) {
          final data = widget.sliderData[index]; // TODO: Lấy dữ liệu từng mục trong slider
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0; // TODO: Mặc định tỷ lệ hiển thị là 1.0
              if (_pageController.position.haveDimensions) {
                scale = _pageController.page! - index;
                scale = (1 - scale.abs() * 0.3).clamp(0.85, 1.0); // FIXME: Điều chỉnh tỷ lệ phóng to/thu nhỏ
              }

              return Center(
                child: Transform.scale(
                  scale: scale, // TODO: Áp dụng tỷ lệ cho từng mục slider
                  child: Container(
                    width: 300,
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 5), // TODO: Khoảng cách giữa các mục slider
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // TODO: Bo góc slider
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // TODO: Tạo bóng cho slider
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15), // TODO: Bo góc ảnh trong slider
                          child: Image.network(
                            data["image"],
                            fit: BoxFit.cover, // FIXME: Đảm bảo ảnh hiển thị đầy đủ
                            width: 300,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              // FIXME: Xử lý lỗi khi tải ảnh
                              return Container(
                                color: Colors.grey,
                                child: const Center(
                                  child: Text(
                                    'Image Error',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 20, // TODO: Vị trí tiêu đề và đánh giá trong slider
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["title"], // FIXME: Đảm bảo tiêu đề tồn tại
                                style: const TextStyle(
                                  color: Colors.white, // TODO: Màu chữ tiêu đề
                                  fontSize: 18, // TODO: Kích thước chữ tiêu đề
                                  fontWeight: FontWeight.bold, // TODO: Chữ đậm cho tiêu đề
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      // TODO: Hiển thị đánh giá sao
                                      return Icon(
                                        starIndex < data["rate"]
                                            ? Icons.star // FIXME: Hiển thị sao đầy nếu đủ điểm
                                            : Icons.star_border, // FIXME: Hiển thị sao rỗng nếu thiếu điểm
                                        color: Colors.yellow,
                                        size: 16,
                                      );
                                    }),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${data["rate"]}/5.0", // FIXME: Đảm bảo điểm đánh giá tồn tại
                                    style: const TextStyle(
                                      color: Colors.white, // TODO: Màu chữ cho đánh giá
                                      fontSize: 14, // TODO: Kích thước chữ đánh giá
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
