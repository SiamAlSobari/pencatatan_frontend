import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mobile/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF1E88E5),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          _buildMenuTile(
            context,
            icon: Icons.flag,
            color: Colors.green,
            title: 'Financial Goals',
            subtitle: 'Track your saving targets',
            onTap: () => Get.toNamed(Routes.GOAL),
          ),
          _buildMenuTile(
            context,
            icon: Icons.account_balance_wallet,
            color: Colors.orange,
            title: 'Budgets',
            subtitle: 'Manage your monthly spending limits',
            onTap: () => Get.toNamed(Routes.BUDGET),
          ),
          _buildMenuTile(
            context,
            icon: Icons.repeat,
            color: Colors.purple,
            title: 'Recurring Transactions',
            subtitle: 'Manage subscriptions and bills',
            onTap: () => Get.toNamed(Routes.RECURRING),
          ),
          const SizedBox(height: 20),
          _buildMenuTile(
            context,
            icon: Icons.logout,
            color: Colors.red,
            title: 'Logout',
            subtitle: 'Sign out from your account',
            onTap: () {
              // implementation
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, {required IconData icon, required Color color, required String title, required String subtitle, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
