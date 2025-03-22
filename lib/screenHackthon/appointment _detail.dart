import 'package:flutter/material.dart';
import 'book_appointment_screen.dart';

class AppointmentScreen extends StatefulWidget {
  final Map<String, dynamic>? doctorInfo;

  const AppointmentScreen({this.doctorInfo, Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Information Card
            _buildDoctorInfo(),
            const SizedBox(height: 20),

            // Consultation Fee Display
            _buildConsultationFee(),
            const SizedBox(height: 20),

            // Available Time Slots Dropdown
            _buildSlotSelection(),
            const SizedBox(height: 20),

            // Appointment Booking Button
            _buildBookAppointmentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doctorInfo?['name'] ?? 'Doctor Name Unavailable',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.doctorInfo?['specialty'] ?? 'Specialty Not Specified',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationFee() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Fee: ₹${widget.doctorInfo?['price'] ?? 'N/A'}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildSlotSelection() {
    Map<String, List<String>> timeSlots = {
      '2023-10-25': ['10:00 AM - 10:30 AM', '11:00 AM - 11:30 AM'],
      '2023-10-26': ['02:00 PM - 02:30 PM', '04:00 PM - 04:30 PM'],
      '2023-10-27': ['09:00 AM - 09:30 AM', '01:00 PM - 01:30 PM'],
    };

    List<String> availableSlots = [];
    timeSlots.forEach((date, slots) {
      for (var slot in slots) {
        availableSlots.add('$date $slot');
      }
    });

    if (selectedSlot != null && !availableSlots.contains(selectedSlot)) {
      selectedSlot = null;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Time Slot:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedSlot,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              isExpanded: true,
              items: availableSlots.map((String slot) {
                return DropdownMenuItem<String>(
                  value: slot,
                  child: Text(
                    slot,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (String? newSlot) {
                setState(() {
                  selectedSlot = newSlot;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookAppointmentButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (selectedSlot == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select a time slot!'),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookAppointmentScreen(
                  doctor: widget.doctorInfo,
                  selectedTimeSlot: selectedSlot,
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Book Appointment',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
