import 'package:flutter/material.dart';

class MyTicketScreen extends StatefulWidget {
  const MyTicketScreen({super.key});

  @override
  _MyTicketScreenState createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  final List<Map<String, dynamic>> tickets = [
    {
      'image': 'https://i.pinimg.com/236x/ac/cf/70/accf70350a52720143f35d7348bad913.jpg',
      'title': 'Movie A',
      'subtitle': 'Date: 2023-12-12',
      'status': 'News',
      'cinema': 'FX Sudirman XXI'
    },
    {
      'image': 'https://i.pinimg.com/236x/64/94/b8/6494b8c06cf9e211da578ee683ebcfc4.jpg',
      'title': 'Movie B',
      'subtitle': 'Date: 2023-12-13',
      'status': 'News',
      'cinema': 'FX Sudirman XXI'
    },
    {
      'image': 'https://i.pinimg.com/236x/78/17/49/781749adeacb18bfb68893e658503e4e.jpg',
      'title': 'Movie C',
      'subtitle': 'Date: 2023-11-10',
      'status': 'Expired',
      'cinema': 'FX Sudirman XXI'
    },
    {
      'image': 'https://i.pinimg.com/236x/68/3a/98/683a980c96a1b1d1887816cf294d3dc0.jpg',
      'title': 'Movie D',
      'subtitle': 'Date: 2023-11-09',
      'status': 'Expired',
      'cinema': 'FX Sudirman XXI'
    },
  ];

  String selectedTab = 'All';

  List<Map<String, dynamic>> getFilteredTickets() {
    if (selectedTab == 'All') {
      return tickets;
    }
    return tickets.where((ticket) => ticket['status'] == selectedTab).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'My Ticket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: const Color(0xFF4A90E2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    indicatorPadding: const EdgeInsets.all(0),
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0xFF808080),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: (index) {
                      setState(() {
                        switch (index) {
                          case 0:
                            selectedTab = 'All';
                            break;
                          case 1:
                            selectedTab = 'News';
                            break;
                          case 2:
                            selectedTab = 'Expired';
                            break;
                        }
                      });
                    },
                    tabs: [
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          width: 98,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("All"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          width: 98,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("News"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          width: 98,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("Expired"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: getFilteredTickets().length,
          itemBuilder: (context, index) {
            final ticket = getFilteredTickets()[index];
            return GestureDetector(
              onTap: () {

                Navigator.pushNamed(context, '/tickets_detail');
                print("Thực hiện chuyển màn");
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        ticket['image'],
                        width: 84,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ticket['subtitle'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Cinema: ${ticket['cinema']}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        backgroundColor: const Color(0xFF0b1028),
      ),
    );
  }
}

