import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/info_card.dart';
import '../widgets/responsive_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Candidate"),
        backgroundColor: const Color(0xff312e81),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        // padding: EdgeInsets.all(20),
        child: ResponsiveContainer(
          child: Column(
            children: [
              InfoCard(
                icon: Icons.person,
                title: "Professional Summary",
                description:
                "A motivated software job seeker focused on building clean, useful, and user-friendly digital products.",
              ),
              InfoCard(
                icon: Icons.lightbulb,
                title: "Unique Strength",
                description:
                "Combines technical development skills with creativity, communication, teamwork, and problem-solving.",
              ),
              InfoCard(
                icon: Icons.flag,
                title: "Career Objective",
                description:
                "To secure a software development role and contribute to real-world applications that create value for users.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}