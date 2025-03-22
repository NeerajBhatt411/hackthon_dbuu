import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'patient_bottom_bar.dart';

class BookAppointmentScreen extends StatelessWidget {
  final Map<String, dynamic>? doctor;
  final String? selectedTimeSlot;

  const BookAppointmentScreen({
    this.doctor,
    this.selectedTimeSlot,
    Key? key,
  }) : super(key: key);

  Future<void> _saveAppointmentToFirestore({
    required String patientName,
    required String phone,
    required String email,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('appointments').add({
        'doctorName': doctor?['name'] ?? 'No Doctor',
        'doctorSpecialty': doctor?['specialty'] ?? 'No Specialty',
        'timeSlot': selectedTimeSlot ?? 'Not Selected',
        'patientName': patientName,
        'phone': phone,
        'email': email,
        'timestamp': DateTime.now().toString(),
      });

      Fluttertoast.showToast(
        msg: 'Appointment Booked Successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PatientBottomBar(),
        ),
            (route) => false,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to book appointment: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor: ${doctor?['name'] ?? 'No Doctor Selected'}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Specialty: ${doctor?['specialty'] ?? 'No Specialty'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time Slot: ${selectedTimeSlot ?? 'Not Selected'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text.trim();
                  String phone = phoneController.text.trim();
                  String email = emailController.text.trim();

                  if (name.isEmpty || phone.isEmpty || email.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please fill all the fields!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    _saveAppointmentToFirestore(
                      patientName: name,
                      phone: phone,
                      email: email,
                      context: context,
                    );
                    nameController.clear();
                    phoneController.clear();
                    emailController.clear();
                  }
                },
                child: Text('Confirm Booking', style: TextStyle(fontSize: 18 ,color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}