import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_appointment_screen.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? doctor; // Make doctor optional

  // Constructor with optional doctor parameter
  const AppointmentDetailsScreen({this.doctor, Key? key}) : super(key: key);

  @override
  _AppointmentDetailsScreenState createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  String? selectedTimeSlot; // To store the selected time slot

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
              widget.doctor?['name'] ?? 'No Doctor Selected', // Handle null case
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.doctor?['specialty'] ?? 'Specialty Not Available', // Handle null case
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),

            // Doctor's Fees
            Text(
              'Consultation Fee: ${widget.doctor?['price'] ?? 'N/A'}', // Handle null case
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
                  if (selectedTimeSlot == null) {
                    // Show error if no time slot is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select a time slot!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Navigate to BookAppointmentScreen with selected time slot
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookAppointmentScreen(
                          doctor: widget.doctor,
                          selectedTimeSlot: selectedTimeSlot,
                        ),
                      ),
                    );
                  }
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

    return DropdownButtonFormField<String>(
      value: selectedTimeSlot,
      decoration: InputDecoration(
        labelText: 'Select Time Slot',
        border: OutlineInputBorder(),
      ),
      items: slots.map((String slot) {
        return DropdownMenuItem<String>(
          value: slot,
          child: Text(slot),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedTimeSlot = newValue;
        });
      },
    );
  }
}