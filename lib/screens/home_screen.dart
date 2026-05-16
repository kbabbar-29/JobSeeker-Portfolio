import 'dart:io'; // Required for File handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Ensure you added this to pubspec.yaml
import '../widgets/app_drawer.dart';
import '../widgets/responsive_container.dart';
import 'projects_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _profileImage; // Stores the selected/captured image file

  /// Displays a professional bottom sheet to choose between Camera and Gallery.
  /// This implementation enhances UX by allowing flexible media sourcing.
  Future<void> _handleImageUpload() async {
    final ImagePicker picker = ImagePicker();

    // Trigger a Modal Bottom Sheet for source selection
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff1f2937), // Matches your dark theme
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              // Option 1: Gallery Selection
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.white),
                title: const Text('Choose from Gallery', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context); // Close sheet
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 85,
                  );
                  if (image != null) _updateProfileState(image.path);
                },
              ),
              // Option 2: Live Camera Capture
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title: const Text('Take a Photo', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context); // Close sheet
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 85,
                  );
                  if (photo != null) _updateProfileState(photo.path);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Private helper to encapsulate the state update logic.
  /// Ensures consistent UI refresh regardless of image source.
  void _updateProfileState(String path) {
    setState(() {
      _profileImage = File(path);
    });
    print("Media successfully loaded: $path");
    // TODO: Connect with Firebase Storage to persist this image online
  }

  // ... keep the rest of your build method and statBox here ...
  Widget statBox(IconData icon, String number, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.16),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white70, size: 18),
            const SizedBox(height: 4),
            Text(number, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(userImage: _profileImage),
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

                  // Profile Image with Camera Interaction
                  GestureDetector(
                    onTap: _handleImageUpload,
                    child: CircleAvatar(
                      radius: 62,
                      backgroundColor: Colors.white,
                      // If a photo exists, show it; otherwise, show the placeholder icon
                      backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                      child: _profileImage == null
                          ? const Icon(Icons.add_a_photo, size: 50, color: Color(0xff6d28d9))
                          : null,
                    ),
                  ),

                  const Text(
                    "Alex Morgan",
                    style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Full-Stack Mobile Developer",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  const Text(
                    "A modern job seeker portfolio featuring real-time camera access and Firebase cloud synchronization.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                  ),

                  Row(
                    children: [
                      statBox(Icons.rocket_launch, "4+", "Projects"),
                      statBox(Icons.bolt, "10", "Skills"),
                      statBox(Icons.history_edu, "2+", "Years"),
                      statBox(Icons.check_circle, "Open", "To Hire"),
                    ],
                  ),

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