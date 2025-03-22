import 'package:flutter/material.dart';
import '../util/app_theme.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  final List<Map<String, dynamic>> doctorList = [
    {'name': 'Dr. Vaamana', 'specialty': 'Dentist', 'rating': 4.7, 'distance': '800m', 'fee': '₹500'},
    {'name': 'Dr. Aayush', 'specialty': 'Cardiologist', 'rating': 4.9, 'distance': '1.2km', 'fee': '₹700'},
    {'name': 'Dr. Rohan', 'specialty': 'Neurologist', 'rating': 4.5, 'distance': '500m', 'fee': '₹600'},
    {'name': 'Dr. Sneha', 'specialty': 'Pediatrician', 'rating': 4.8, 'distance': '900m', 'fee': '₹550'},
    {'name': 'Dr. Alok', 'specialty': 'Orthopedic', 'rating': 4.6, 'distance': '1.1km', 'fee': '₹650'},
    {'name': 'Dr. Priya', 'specialty': 'Dermatologist', 'rating': 4.4, 'distance': '700m', 'fee': '₹400'},
    {'name': 'Dr. Manish', 'specialty': 'ENT', 'rating': 4.7, 'distance': '850m', 'fee': '₹450'},
    {'name': 'Dr. Kiran', 'specialty': 'General Physician', 'rating': 4.3, 'distance': '600m', 'fee': '₹350'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor Information",
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffd1e8f1),
      ),
      body: ListView.builder(
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          final doctor = doctorList[index];
          return GestureDetector(
            onTap: () {
              // Implement navigation to appointment details
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/doctorimage.png'),
                ),
                title: Text(
                  doctor['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor['specialty'], style: TextStyle(color: Colors.grey[700])),
                    Text("Fee: ${doctor['fee']}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(doctor['rating'].toString()),
                      ],
                    ),
                    Text(doctor['distance'], style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
