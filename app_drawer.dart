import 'dart:io';
import 'package:flutter/material.dart';
import 'package:job_seeker_portfolio/screens/about_screen.dart';
import 'package:job_seeker_portfolio/screens/contact_screen.dart';
import 'package:job_seeker_portfolio/screens/education_screen.dart';
import 'package:job_seeker_portfolio/screens/experience_screen.dart';
import 'package:job_seeker_portfolio/screens/projects_screen.dart';
import 'package:job_seeker_portfolio/screens/skills_screen.dart';
import 'home_screen.dart';

class AppDrawer extends StatelessWidget {
  /// Receives the profile image file from HomeScreen to keep the UI in sync.
  final File? userImage;

  /// Constructor: Added [userImage] as an optional parameter.
  const AppDrawer({super.key, this.userImage});

  /// Helper method to handle screen navigation and drawer closing.
  void openScreen(BuildContext context, Widget screen) {
    Navigator.pop(context); // Close the drawer before navigating
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 55, 20, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1e1b4b), Color(0xff6d28d9)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Synchronized Profile Image
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                  // Logic: If image exists, use FileImage; otherwise, show default icon.
                  backgroundImage: userImage != null ? FileImage(userImage!) : null,
                  child: userImage == null
                      ? const Icon(Icons.person, size: 42, color: Color(0xff6d28d9))
                      : null,
                ),
                const SizedBox(height: 16),
                const Text(
                  "HireTrack Portfolio",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Group 2: Job Seeker Portfolio",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // Navigation Menu Items
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

  /// Reusable widget for drawer list items to maintain consistency.
  Widget drawerItem(BuildContext context, IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff6d28d9)),
      title: Text(title),
      onTap: () => openScreen(context, screen),
    );
  }
}