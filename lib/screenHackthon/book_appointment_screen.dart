import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:fluttertoast/fluttertoast.dart'; // For toast messages

import 'patient_home_screen.dart'; // Import PatientHomeScreen

class BookAppointmentScreen extends StatelessWidget {
  final Map<String, dynamic>? doctor; // Add doctor parameter
  final String? selectedTimeSlot; // Add selectedTimeSlot parameter

  // Constructor with doctor and selectedTimeSlot parameters
  const BookAppointmentScreen({
    this.doctor,
    this.selectedTimeSlot,
    Key? key,
  }) : super(key: key);

  // Function to save appointment to Firestore
  Future<void> _saveAppointmentToFirestore({
    required String patientName,
    required String phone,
    required String email,
    required BuildContext context,
  }) async {
    try {
      // Save data to Firestore
      await FirebaseFirestore.instance.collection('appointments').add({
        'doctorName': doctor?['name'] ?? 'No Doctor',
        'doctorSpecialty': doctor?['specialty'] ?? 'No Specialty',
        'timeSlot': selectedTimeSlot ?? 'Not Selected',
        'patientName': patientName,
        'phone': phone,
        'email': email,
        'timestamp': DateTime.now().toString(),
      });

      // Show success toast
      Fluttertoast.showToast(
        msg: 'Appointment Booked Successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Navigate to PatientHomeScreen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PatientHomeScreen(),
        ),
            (route) => false, // Remove all previous routes
      );
    } catch (e) {
      // Show error toast
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
    // Controllers for form fields
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor's Name
            Text(
              'Booking Appointment with ${doctor?['name'] ?? 'No Doctor Selected'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Selected Time Slot
            Text(
              'Selected Time Slot: ${selectedTimeSlot ?? 'Not Selected'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),

            // Add your booking form or details here
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            // Confirm Booking Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validate form fields
                  String name = nameController.text.trim();
                  String phone = phoneController.text.trim();
                  String email = emailController.text.trim();

                  if (name.isEmpty || phone.isEmpty || email.isEmpty) {
                    // Show error if any field is empty
                    Fluttertoast.showToast(
                      msg: 'Please fill all the fields!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    // Save appointment to Firestore
                    _saveAppointmentToFirestore(
                      patientName: name,
                      phone: phone,
                      email: email,
                      context: context,
                    );

                    // Clear text fields
                    nameController.clear();
                    phoneController.clear();
                    emailController.clear();
                  }
                },
                child: Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}