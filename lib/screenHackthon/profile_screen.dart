import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/book_appointment_screen.dart';
import 'package:untitled2/screenHackthon/reports_screen.dart';
import 'package:untitled2/screenHackthon/upcoming_appoinments.dart';
import 'package:untitled2/util/app_theme.dart';
import 'app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Profile Header
          SliverAppBar(
            expandedHeight: 200, // Height of the expanded header
            pinned: true, // App bar stays pinned at the top
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
                    // Dummy Profile Image
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage:
                      AssetImage('assets/icons/profile.png'), // Add a dummy image in assets
                    ),
                    const SizedBox(height: 10),
                    // User Name
                    Text(
                      "Neeraj Bhatt",
                      style: Style.headLineStyle3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // User Email
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
          // Body with Medical Options
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildOptionTile(
                icon: Icons.assignment,
                title: "Reports",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ReportsScreen(),
                    ),
                  );
                },
              ),
              _buildOptionTile(
                icon: Icons.calendar_today,
                title: "Appointments",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpcomingAppointments(),
                    ),
                  );
                },
              ),
              _buildOptionTile(
                icon: Icons.book_online,
                title: "Book Appointment",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookAppointmentScreen(),
                    ),
                  );
                },
              ),
              _buildOptionTile(
                icon: Icons.medical_services,
                title: "Medical History",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ReportsScreen(),
                    ),
                  );
                },
              ),
              _buildOptionTile(
                icon: Icons.contact_support,
                title: "Contact Support",
                onTap: () {
                  // Handle contact support
                },
              ),
              _buildOptionTile(
                icon: Icons.privacy_tip,
                title: "Privacy Policy",
                onTap: () {
                  // Handle privacy policy
                },
              ),
              _buildOptionTile(
                icon: Icons.logout,
                title: "Sign Out",
               onTap: () {

               },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Reusable Option Tile Widget
  Widget _buildOptionTile({
    required IconData icon,
    required String title,
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
        title,
        style: Style.headLineStyle2.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.primaryColor),
      onTap: onTap,
    );
  }
}