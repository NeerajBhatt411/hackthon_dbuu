import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_appointment_screen.dart'; // Ensure this import is correct

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
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor's Name and Specialty
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor?['name'] ?? 'No Doctor Selected',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.doctor?['specialty'] ?? 'Specialty Not Available',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Doctor's Fees
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Consultation Fee: ${widget.doctor?['price'] ?? 'N/A'}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Available Slots
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Slots:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildAvailableSlots(), // Show available slots
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

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
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
    // Example list of available slots with dates
    Map<String, List<String>> slots = {
      '2023-10-25': ['10:00 AM - 10:30 AM', '11:00 AM - 11:30 AM'],
      '2023-10-26': ['02:00 PM - 02:30 PM', '04:00 PM - 04:30 PM'],
      '2023-10-27': ['09:00 AM - 09:30 AM', '01:00 PM - 01:30 PM'],
    };

    // Flatten the map into a list of strings
    List<String> slotList = [];
    slots.forEach((date, times) {
      for (var time in times) {
        slotList.add('$date $time'); // Combine date and time
      }
    });

    // Ensure selectedTimeSlot is either null or matches one of the slotList values
    if (selectedTimeSlot != null && !slotList.contains(selectedTimeSlot)) {
      selectedTimeSlot = null;
    }

    return Container(
      width: double.infinity, // Take full width
      child: DropdownButtonFormField<String>(
        value: selectedTimeSlot,
        decoration: InputDecoration(
          labelText: 'Select Time Slot',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        isExpanded: true, // Allow the dropdown to take full width
        items: slotList.map((String slot) {
          return DropdownMenuItem<String>(
            value: slot,
            child: Text(
              slot,
              overflow: TextOverflow.ellipsis, // Handle overflow
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedTimeSlot = newValue;
          });
        },
      ),
    );
  }
}