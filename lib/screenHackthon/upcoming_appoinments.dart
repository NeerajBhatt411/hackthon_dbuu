import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'payment_details.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  Stream<QuerySnapshot> _getAppointmentsStream() {
    return FirebaseFirestore.instance
        .collection('appointments')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Color _generateCardColor(int index) {
    final List<Color> colorOptions = [
      Colors.tealAccent,
      Colors.deepPurpleAccent,
      Colors.amberAccent,
      Colors.indigoAccent,
      Colors.pinkAccent,
    ];
    return colorOptions[index % colorOptions.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming Appointments',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getAppointmentsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No appointments available.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var appointmentData = doc.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: _generateCardColor(index).withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Doctor: ${appointmentData['doctorName']}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Specialty: ${appointmentData['doctorSpecialty']}'),
                      Text('Time: ${appointmentData['timeSlot']}'),
                      Text('Patient: ${appointmentData['patientName']}'),
                      Text('Email: ${appointmentData['email']}'),
                      Text('Phone: ${appointmentData['phone']}'),
                      Text('Booked on: ${appointmentData['timestamp']}'),
                      const SizedBox(height: 12),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentDetailsScreen(
                                  doctorName: appointmentData['doctorName'],
                                  doctorSpecialty:
                                  appointmentData['doctorSpecialty'],
                                  timeSlot: appointmentData['timeSlot'],
                                  patientName: appointmentData['patientName'],
                                  email: appointmentData['email'],
                                  phone: appointmentData['phone'],
                                  timestamp: appointmentData['timestamp'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Proceed to Payment',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}