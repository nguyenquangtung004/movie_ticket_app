import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      width: 247,
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class HorizontalVideoList extends StatelessWidget {
  final List<String> videoUrls;

  const HorizontalVideoList({Key? key, required this.videoUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trailer and Song:",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 144,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: VideoWidget(videoUrl: videoUrls[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
