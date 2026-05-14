import 'package:flutter/material.dart';

class SkillBar extends StatelessWidget {
  final String skill;
  final double value;

  const SkillBar({
    super.key,
    required this.skill,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(skill, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("${(value * 100).toInt()}%"),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: value,
              minHeight: 9,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xff6d28d9),
            ),
          ],
        ),
      ),
    );
  }
}