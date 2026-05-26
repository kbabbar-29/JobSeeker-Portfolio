import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/app_drawer.dart';
import '../widgets/info_card.dart';
import '../widgets/responsive_container.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false;

  Future<void> submitMessage() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields."),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseFirestore.instance
          .collection('contact_messages')
          .add({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'message': messageController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Clear fields after successful submission
      nameController.clear();
      emailController.clear();
      messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Message submitted successfully."),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact / Hire Me"),
        backgroundColor: const Color(0xff312e81),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Column(
            children: [
              const InfoCard(
                icon: Icons.email,
                title: "Email",
                description: "alex.morgan@example.com",
              ),
              const InfoCard(
                icon: Icons.phone,
                title: "Phone",
                description: "+1 000 000 0000",
              ),
              const InfoCard(
                icon: Icons.location_on,
                title: "Availability",
                description:
                "Available for remote, hybrid, and on-site software roles.",
              ),

              const SizedBox(height: 10),

              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Text(
                        "Send a Message",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Your Name",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Your Email",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: messageController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: "Message",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: isLoading ? null : submitMessage,
                          icon: isLoading
                              ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                              : const Icon(Icons.send),
                          label: Text(
                            isLoading
                                ? "Submitting..."
                                : "Submit Message",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}