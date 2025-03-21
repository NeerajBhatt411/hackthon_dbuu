import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/help.dart';
import 'package:untitled2/screenHackthon/patient_home_screen.dart';
import 'package:untitled2/screenHackthon/profile_screen.dart';
import 'package:untitled2/screenHackthon/reports_screen.dart';

class PatientBottomBar extends StatefulWidget {
  const PatientBottomBar({super.key});

  @override
  State<PatientBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<PatientBottomBar> {
  List<Widget> list = [PatientHomeScreen(), ReportsScreen(), Help(), ProfileScreen()];

  int _selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: list[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        elevation: 10,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home, size: 24, color: _selectedIndex == 0 ? Colors.deepPurple : Colors.black),
                Text("Home", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                if (_selectedIndex == 0)
                  Container(height: 4, width: 40, color: Colors.blue),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.insert_drive_file, size: 24, color: _selectedIndex == 1 ? Colors.deepPurple : Colors.black),
                Text("Reports", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                if (_selectedIndex == 1)
                  Container(height: 4, width: 40, color: Colors.blue),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.help, size: 24, color: _selectedIndex == 2 ? Colors.deepPurple : Colors.black),
                Text("Help", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                if (_selectedIndex == 2)
                  Container(height: 4, width: 40, color: Colors.blue),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 24, color: _selectedIndex == 3 ? Colors.deepPurple : Colors.black),
                Text("Profile", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                if (_selectedIndex == 3)
                  Container(height: 4, width: 40, color: Colors.blue),
              ],
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}