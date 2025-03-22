import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/reports_screen.dart';
import 'package:untitled2/screenHackthon/upcoming_appoinments.dart';
import '../util/app_theme.dart';
import 'app_style.dart';
import 'book_appointment_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Profile Header with SliverAppBar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, Colors.blue.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/icons/profile.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Neeraj Bhatt",
                      style: Style.headLineStyle3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "neerajbhattadx@gmail.com",
                      style: Style.headLineStyle2.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Profile Options List
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildMenuItem(
                icon: Icons.assignment,
                label: "Reports",
                onTap: () => _navigateToScreen(context, ReportsScreen()),
              ),
              _buildMenuItem(
                icon: Icons.calendar_today,
                label: "Appointments",
                onTap: () => _navigateToScreen(context, const UpcomingAppointments()),
              ),
              _buildMenuItem(
                icon: Icons.book_online,
                label: "Book Appointment",
                onTap: () => _navigateToScreen(context, const BookAppointmentScreen()),
              ),
              _buildMenuItem(
                icon: Icons.medical_services,
                label: "Medical History",
                onTap: () => _navigateToScreen(context, ReportsScreen()),
              ),
              _buildMenuItem(
                icon: Icons.contact_support,
                label: "Contact Support",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.privacy_tip,
                label: "Privacy Policy",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.logout,
                label: "Sign Out",
                onTap: () {},
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Reusable Menu Item Widget
  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.primaryColor),
      ),
      title: Text(
        label,
        style: Style.headLineStyle2.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.primaryColor),
      onTap: onTap,
    );
  }

  // Navigation Helper
  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}