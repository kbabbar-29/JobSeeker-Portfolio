import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/info_card.dart';
import '../widgets/responsive_container.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
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
                icon: Icons.school,
                title: "Computer Science Education",
                description:
                "Studied programming, databases, software engineering, computer systems, and application development.",
              ),
              InfoCard(
                icon: Icons.computer,
                title: "Technical Learning",
                description:
                "Learning Flutter, Firebase, cloud services, mobile development, and modern software practices.",
              ),
              InfoCard(
                icon: Icons.workspace_premium,
                title: "Certifications & Practice",
                description:
                "Completed practical learning modules and mini-projects related to programming and app development.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}