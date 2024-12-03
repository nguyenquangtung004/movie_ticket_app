import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/video_screen.dart';

class MovieTabs extends StatelessWidget {
  const MovieTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
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
          height: 1000, // Chiều cao nội dung tab
          child: TabBarView(
            children: [
              // Tab "About Movie"
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Synopsis:\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              height: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Wreck-It Ralph wants to be loved by many people like his kind friend, Fix-It Felix. ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                "But no one likes evil characters like Ralph. \n",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              height: 8,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Ralph's goal was simple, wanting to win and get a medal to be considered a hero. But without realizing Ralph instead paved the way for criminals who can kill all the games in the game complex ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "read more.",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Cast & Crew:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 120,//Khung list view
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // Số lượng phần tử trong danh sách
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ90EwClzVT2DOgDNo2vO9Y09aYI4tHtmM9KHWeZ0Wu7wg_-sFwyDbCDTg&s=10', // URL của ảnh placeholder
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dakota Fanning', // Tên diễn viên
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    
                      HorizontalVideoList(videoUrls: videoUrls),
                  ],
                ),
              ),
              // Tab "Review"
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Review Section\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "User reviews will be displayed here. Add dynamic content for reviews ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text:
                                "or allow users to submit their feedback. Make sure to engage your audience!",
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
