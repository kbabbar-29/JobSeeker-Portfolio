import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/info_card.dart';
import '../widgets/responsive_container.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Experience"),
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
                icon: Icons.work,
                title: "Junior Software Developer",
                description:
                "Worked on UI screens, reusable components, debugging, testing, and app feature development.",
              ),
              InfoCard(
                icon: Icons.groups,
                title: "Team Project Experience",
                description:
                "Collaborated with team members to plan, design, build, test, and present software projects.",
              ),
              InfoCard(
                icon: Icons.design_services,
                title: "Portfolio Design Experience",
                description:
                "Designed a professional portfolio layout to clearly present candidate strengths and value.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}