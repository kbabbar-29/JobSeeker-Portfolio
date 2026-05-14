import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/responsive_container.dart';
import 'projects_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget statBox(String number, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.16),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          children: [
            Text(number, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff111827), Color(0xff312e81), Color(0xff7c3aed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
            child: ResponsiveContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      const Spacer(),
                      const Text("Group 2", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  // const SizedBox(height: 25),
                  const CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 80, color: Color(0xff6d28d9)),
                  ),
                  // const SizedBox(height: 20),
                  const Text(
                    "Alex Morgan",
                    style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Full-Stack Mobile Developer",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  // const SizedBox(height: 18),
                  const Text(
                    "A modern job seeker portfolio that highlights skills, projects, experience, and professional value for potential employers.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                  ),
                  // const SizedBox(height: 24),
                  Row(
                    children: [
                      statBox("4+", "Projects"),
                      statBox("10", "Skills"),
                      statBox("2+", "Years Learning"),
                      statBox("Open", "To Hire"),
                      // const SizedBox(height: 70),
                    ],
                  ),
                  // const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProjectsScreen()));
                          },
                          icon: const Icon(Icons.work),
                          label: const Text("View Projects"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactScreen()));
                          },
                          icon: const Icon(Icons.mail),
                          label: const Text("Hire Me"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}