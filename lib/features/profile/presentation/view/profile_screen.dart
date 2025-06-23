import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: const Center(child: Text('Профиль')),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
