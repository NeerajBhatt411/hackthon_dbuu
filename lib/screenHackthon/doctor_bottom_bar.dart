import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/upcoming_appoinments.dart';
import 'package:untitled2/screenHackthon/profile_screen.dart';
import 'package:untitled2/screenHackthon/reports_screen.dart';

import 'home_screen1.dart';

class PatientBottomBar extends StatefulWidget {
  const PatientBottomBar({super.key});

  @override
  State<PatientBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<PatientBottomBar> {
  List<Widget> list = [HomeScreen1(), ReportsScreen(), UpcomingAppointments(), ProfileScreen()];

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
                Text("Home", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                if (_selectedIndex == 0)
                  Container(
                    height: 5,
                    width: 40,
                    color: Colors.black,
                  ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Reports", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                if (_selectedIndex == 1)
                  Container(
                    height: 5,
                    width: 40,
                    color: Colors.black,
                  ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Help", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                if (_selectedIndex == 2)
                  Container(
                    height: 5,
                    width: 40,
                    color: Colors.black,
                  ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Profile", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                if (_selectedIndex == 3)
                  Container(
                    height: 5,
                    width: 40,
                    color: Colors.black,
                  ),
              ],
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
