import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/project_card.dart';
import '../widgets/responsive_container.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: const Color(0xff312e81),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        // padding: EdgeInsets.all(20),
        child: ResponsiveContainer(
          child: Column(
            children: [
              ProjectCard(
                icon: Icons.task_alt,
                title: "Task Manager App",
                description:
                "A productivity app for creating, updating, and organizing daily tasks.",
                tech: "Flutter, Firebase",
                value: "Improves time management and productivity.",
              ),
              ProjectCard(
                icon: Icons.shopping_bag,
                title: "E-Commerce App",
                description:
                "A shopping app concept with product browsing, cart system, and clean UI.",
                tech: "Flutter, Dart, REST API",
                value: "Supports a smooth digital shopping experience.",
              ),
              ProjectCard(
                icon: Icons.cloud,
                title: "Weather App",
                description:
                "A weather app that displays current weather details using API data.",
                tech: "Flutter, API Integration",
                value: "Provides quick and useful real-time information.",
              ),
              ProjectCard(
                icon: Icons.person_search,
                title: "Job Finder UI",
                description:
                "A job search interface with job listings, company details, and application status.",
                tech: "Flutter, UI/UX",
                value: "Helps candidates explore opportunities easily.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}