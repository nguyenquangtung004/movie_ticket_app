import 'dart:async';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final List<Map<String, dynamic>> sliderData;

  const SliderWidget({Key? key, required this.sliderData}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer.cancel(); // Hủy Timer khi widget bị hủy
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == widget.sliderData.length - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
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
      height: 220, // Đặt chiều cao cố định cho slider
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.sliderData.length,
        itemBuilder: (context, index) {
          final data = widget.sliderData[index];
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;
              if (_pageController.position.haveDimensions) {
                scale = _pageController.page! - index;
                scale = (1 - scale.abs() * 0.3).clamp(0.85, 1.0);
              }

              return Center(
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 300,
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            data["image"],
                            fit: BoxFit.cover,
                            width: 300,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
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
                          bottom: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < data["rate"]
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.yellow,
                                        size: 16,
                                      );
                                    }),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${data["rate"]}/5.0",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
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
