import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_appointment_screen.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? doctor; // Make doctor optional

  // Constructor with optional doctor parameter
  const AppointmentDetailsScreen({this.doctor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor's Name and Specialty
            Text(
              doctor?['name'] ?? 'No Doctor Selected', // Handle null case
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              doctor?['specialty'] ?? 'Specialty Not Available', // Handle null case
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),

            // Doctor's Fees
            Text(
              'Consultation Fee: ${doctor?['price'] ?? 'N/A'}', // Handle null case
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),

            // Available Slots
            Text(
              'Available Slots:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildAvailableSlots(), // Show available slots
            SizedBox(height: 24),

            // Book Appointment Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to BookAppointmentScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookAppointmentScreen(),
                    ),
                  );
                },
                child: Text(
                  'Book Appointment',
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

  // Widget to show available slots
  Widget _buildAvailableSlots() {
    // Example list of available slots
    List<String> slots = [
      '10:00 AM - 10:30 AM',
      '11:00 AM - 11:30 AM',
      '02:00 PM - 02:30 PM',
      '04:00 PM - 04:30 PM',
    ];

    return Column(
      children: slots.map((slot) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(slot),
            onTap: () {
              // Handle slot selection
              print('Selected Slot: $slot');
            },
          ),
        );
      }).toList(),
    );
  }
}

