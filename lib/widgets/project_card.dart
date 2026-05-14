import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String tech;
  final String value;

  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tech,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 38, color: const Color(0xff6d28d9)),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(height: 1.4)),
            const SizedBox(height: 12),
            Chip(label: Text("Tech: $tech")),
            const SizedBox(height: 6),
            Text(
              "Value: $value",
              style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xff1e1b4b)),
            ),
          ],
        ),
      ),
    );
  }
}