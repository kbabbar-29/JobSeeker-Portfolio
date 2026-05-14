import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/responsive_container.dart';
import '../widgets/skill_bar.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills"),
        backgroundColor: const Color(0xff312e81),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        // padding: EdgeInsets.all(20),
        child: ResponsiveContainer(
          child: Column(
            children: [
              SkillBar(skill: "Flutter & Dart", value: 0.90),
              SkillBar(skill: "Firebase", value: 0.85),
              SkillBar(skill: "UI/UX Design", value: 0.82),
              SkillBar(skill: "REST API Integration", value: 0.78),
              SkillBar(skill: "GitHub & Version Control", value: 0.80),
              SkillBar(skill: "Problem Solving", value: 0.88),
              SkillBar(skill: "Team Collaboration", value: 0.86),
            ],
          ),
        ),
      ),
    );
  }
}