import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/video_screen.dart';

class MovieTabs extends StatelessWidget {
  const MovieTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Danh sách URL video
    final List<String> videoUrls = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ];

    // Chuyển đổi danh sách URL video thành danh sách chứa cả URL và thumbnail
    final List<Map<String, String>> videoData = videoUrls
        .map((url) => {
              'videoUrl': url,
              'thumbnailUrl': 'https://via.placeholder.com/150', // Placeholder thumbnail
            })
        .toList();

    // Dữ liệu dàn diễn viên
    final List<Map<String, String>> castData = [
      {
        "name": "Dakota Fanning",
        "avatar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ90EwClzVT2DOgDNo2vO9Y09aYI4tHtmM9KHWeZ0Wu7wg_-sFwyDbCDTg&s=10"
      },
      {
        "name": "Elle Fanning",
        "avatar": "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQ67ZicdJVc_p66PwosUc4J28NZ13qlY0retwNUlIGYUAzmDL7DaPhes8UItenMzOkAIpH1SFY&s=19"
      },
      {
        "name": "Hitoshi Takagi",
        "avatar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRHxyYhq3rRmo4GnTiB2E67xLxxIduihlJ-w2tfTbmwDOyUGS_Qt5mfIs&s=10"
      },
    ];

    return Column(
      children: [
        const TabBar(
          indicatorColor: Colors.blueAccent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "About Movie"),
            Tab(text: "Review"),
          ],
        ),
        SizedBox(
          height: 600,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Synopsis:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "Wreck-It Ralph wants to be loved by many people...",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Cast & Crew:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: castData.length,
                        itemBuilder: (context, index) {
                          final castMember = castData[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    castMember["avatar"]!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 80,
                                        height: 80,
                                        color: Colors.grey,
                                        child: const Icon(Icons.person,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  castMember["name"]!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    HorizontalVideoList(videos: videoData),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "User reviews will be displayed here...",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
