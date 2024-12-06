import 'package:flutter/material.dart';
import 'package:movie_ticket_app/View/SignIn_screen.dart';
import 'package:movie_ticket_app/View/on_boarding.dart';
// import 'package:movie_ticket_app/View/sign_in_screen.dart';
import 'package:movie_ticket_app/View/sign_up_screen.dart';
import 'package:movie_ticket_app/View/tickets_detail_screen.dart';
import 'package:movie_ticket_app/View/user_profiling_screen.dart';
import 'package:movie_ticket_app/View/confirmation_profile.dart';
import 'package:movie_ticket_app/View/my_ticket_screen.dart';
import 'package:movie_ticket_app/View/oder_screen.dart';
import 'package:movie_ticket_app/Navigation/nav_bottom.dart';
import 'package:movie_ticket_app/View/home_screen.dart';
import 'package:movie_ticket_app/View/welcome_screen.dart'; // Import HomeScreen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0b1028),
        scaffoldBackgroundColor: const Color(0xFF0b1028),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0b1028),
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboard': (context) => const OnBoarding(),
        '/login': (context) => const SigninScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/user_profiling': (context) => const UserProfilingScreen(),
        '/confirmation_pro': (context) => const ConfirmationProfileScreen(),
        '/': (context) => const BottomNavBar(),
        '/my_ticket': (context) => const MyTicketScreen(),
        '/tickets_detail': (context) => const TicketsDetailScreen(),
        '/order': (context) => const OderScreen(),
      },
      // home: TicketsDetailScreen(),
    );
  }
}
