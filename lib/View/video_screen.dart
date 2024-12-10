import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl; // URL của ảnh hiển thị trước video

  const VideoWidget({
    Key? key,
    required this.videoUrl,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false; // Trạng thái video
  bool isInitialized = false; // Trạng thái khởi tạo video

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          isInitialized = true;
        });
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isInitialized) {
      setState(() {
        if (isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
        isPlaying = !isPlaying;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: SizedBox(
        height: 144,
        width: 247,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Hiển thị ảnh nền nếu video chưa được phát hoặc đang tạm dừng
            if (!isInitialized || !isPlaying)
              Image.network(
                widget.thumbnailUrl,
                height: 144,
                width: 247,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            // Video player
            if (isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            // Biểu tượng phát
            if (!isPlaying)
              const Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 50,
              ),
          ],
        ),
      ),
    );
  }
}

class HorizontalVideoList extends StatelessWidget {
  final List<Map<String, String>> videos; // Danh sách video và ảnh nền

  const HorizontalVideoList({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trailer and Song:",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 144,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: VideoWidget(
                  videoUrl: video['videoUrl']!,
                  thumbnailUrl: video['thumbnailUrl']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
