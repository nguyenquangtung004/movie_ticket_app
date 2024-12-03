import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/video_screen.dart';

class MovieTabs extends StatelessWidget {
  const MovieTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoUrls = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ];

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
      {
        "name": "Noriko Hidaka",
        "avatar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp5YYrkKpiRO2XUhc-OnbUyvP5TI9kll3Ig-HiEnviTNcVkI9eXQcpQt0&s=10"
      },
      {
        "name": "Lisa Michelson",
        "avatar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGETN0rOfHuC-CCIHX5ETAhJ62gJeADOuH8-LW3U0&s=10"
      },
      {
        "name": "Pat Carroll",
        "avatar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiNizOmPlPMfS3xf4332o5XYpkozS0hKOKRi4asJ9C7uBsIJ3g4sz6oQg&s=10"
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
          height: 480, // Chiều cao nội dung tab
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
                      height: 120, // Khung list view
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
