import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const JobSeekerPortfolioApp());
}

class JobSeekerPortfolioApp extends StatelessWidget {
  const JobSeekerPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HireTrack Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xfff4f6fb),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}