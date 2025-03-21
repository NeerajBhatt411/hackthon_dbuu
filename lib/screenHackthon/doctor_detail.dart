import 'package:flutter/material.dart';
import '../util/app_theme.dart';
import 'appointment _detail.dart';

class DocotorDetail extends StatefulWidget {
  const DocotorDetail({super.key});

  @override
  State<DocotorDetail> createState() => _DocotorDetailState();
}

class _DocotorDetailState extends State<DocotorDetail> {
  final List<Map<String, dynamic>> doctors = [
    {'name': 'Dr. Vaamana', 'specialty': 'Dentist', 'rating': 4.7, 'distance': '800m', 'price': '₹500'},
    {'name': 'Dr. Aayush', 'specialty': 'Cardiologist', 'rating': 4.9, 'distance': '1.2km', 'price': '₹700'},
    {'name': 'Dr. Rohan', 'specialty': 'Neurologist', 'rating': 4.5, 'distance': '500m', 'price': '₹600'},
    {'name': 'Dr. Sneha', 'specialty': 'Pediatrician', 'rating': 4.8, 'distance': '900m', 'price': '₹550'},
    {'name': 'Dr. Alok', 'specialty': 'Orthopedic', 'rating': 4.6, 'distance': '1.1km', 'price': '₹650'},
    {'name': 'Dr. Priya', 'specialty': 'Dermatologist', 'rating': 4.4, 'distance': '700m', 'price': '₹400'},
    {'name': 'Dr. Manish', 'specialty': 'ENT', 'rating': 4.7, 'distance': '850m', 'price': '₹450'},
    {'name': 'Dr. Kiran', 'specialty': 'General Physician', 'rating': 4.3, 'distance': '600m', 'price': '₹350'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor Detail",
          style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffd1e8f1),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetailsScreen(doctor: doctor),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/doctorimage.png'), // Change as needed
                ),
                title: Text(doctor['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor['specialty']),
                    Text("Fee: ${doctor['price']}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
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
                    Text(doctor['distance']),
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


