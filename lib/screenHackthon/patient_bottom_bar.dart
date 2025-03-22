import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/upcoming_appoinments.dart';
import 'package:untitled2/screenHackthon/patient_home_screen.dart';
import 'package:untitled2/screenHackthon/profile_screen.dart';
import 'package:untitled2/screenHackthon/reports_screen.dart';

class PatientBottomBar extends StatefulWidget {
  const PatientBottomBar({super.key});

  @override
  State<PatientBottomBar> createState() => _PatientBottomBarState();
}

class _PatientBottomBarState extends State<PatientBottomBar> {
  final List<Widget> _screens = [
    const PatientHomeScreen(),
     ReportsScreen(),
    const UpcomingAppointments(),
    const ProfileScreen(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        items: List.generate(4, (index) => _buildNavItem(index)),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    final List<Map<String, dynamic>> _navItems = [
      {"icon": Icons.home, "label": "Home"},
      {"icon": Icons.insert_drive_file, "label": "Reports"},
      {"icon": Icons.calendar_month_outlined, "label": "Appointments"},
      {"icon": Icons.person, "label": "Profile"},
    ];

    bool isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_navItems[index]["icon"], size: 24, color: isSelected ? Colors.blue : Colors.black),
          Text(_navItems[index]["label"], style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          if (isSelected) Container(height: 4, width: 40, color: Colors.blue),
        ],
      ),
      label: "",
    );
  }
}
