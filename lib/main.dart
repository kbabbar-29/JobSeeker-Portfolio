import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseFirestore.instance.collection('test').add({
    'name': 'Komal',
    'project': 'Job Seeker Portfolio',
    'time': DateTime.now().toString(),
  });

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