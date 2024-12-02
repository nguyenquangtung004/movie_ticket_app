import 'package:flutter/material.dart';

class MovieTabs extends StatelessWidget {
  const MovieTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 300, // Chiều cao nội dung tab
          child: TabBarView(
            children: [
              // Tab "About Movie"
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
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
                       WidgetSpan(child: SizedBox(height: 16,),),
                      TextSpan(
                        text:
                            "Wreck-It Ralph wants to be loved by many people like his kind friend, Fix-It Felix. ",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "But no one likes evil characters like Ralph. \n",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(height: 8,),),

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
              ),
              // Tab "Review"
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                    const Text(
                      "No reviews yet.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
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
