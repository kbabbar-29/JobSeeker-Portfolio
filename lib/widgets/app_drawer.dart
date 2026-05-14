import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/skills_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/experience_screen.dart';
import '../screens/education_screen.dart';
import '../screens/contact_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void openScreen(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 55, 20, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1e1b4b), Color(0xff6d28d9)],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 42, color: Color(0xff6d28d9)),
                ),
                SizedBox(height: 16),
                Text(
                  "HireTrack Portfolio",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Group 2: Job Seeker Portfolio",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          drawerItem(context, Icons.home, "Home", const HomeScreen()),
          drawerItem(context, Icons.person, "About", const AboutScreen()),
          drawerItem(context, Icons.star, "Skills", const SkillsScreen()),
          drawerItem(context, Icons.work, "Projects", const ProjectsScreen()),
          drawerItem(context, Icons.timeline, "Experience", const ExperienceScreen()),
          drawerItem(context, Icons.school, "Education", const EducationScreen()),
          drawerItem(context, Icons.mail, "Contact", const ContactScreen()),
        ],
      ),
    );
  }

  Widget drawerItem(BuildContext context, IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff6d28d9)),
      title: Text(title),
      onTap: () => openScreen(context, screen),
    );
  }
}