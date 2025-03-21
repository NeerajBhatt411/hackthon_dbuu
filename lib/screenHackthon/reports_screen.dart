import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Reports',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.blueAccent.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card 1: Appointment 1 Report
            _buildAppointmentCard(
              context: context,
              appointmentDate: 'October 10, 2025',
              doctorName: 'Dr. Vaamana',
              fees: '₹500',
              problem: 'Fever and Cold',
              doctorSuggestion: 'Take Paracetamol and rest for 3 days.',
            ),
            SizedBox(height: 16),

            // Card 2: Appointment 2 Report
            _buildAppointmentCard(
              context: context,
              appointmentDate: 'October 15, 2025',
              doctorName: 'Dr. Aayush',
              fees: '₹700',
              problem: 'Back Pain',
              doctorSuggestion: 'Do physiotherapy exercises and avoid heavy lifting.',
            ),
            SizedBox(height: 16),

            // Card 3: Appointment 3 Report
            _buildAppointmentCard(
              context: context,
              appointmentDate: 'November 5, 2025',
              doctorName: 'Dr. Sneha',
              fees: '₹550',
              problem: 'Headache',
              doctorSuggestion: 'Take Crocin and avoid stress.',
            ),
            SizedBox(height: 16),

            // Card 4: Appointment 4 Report
            _buildAppointmentCard(
              context: context,
              appointmentDate: 'December 20, 2025',
              doctorName: 'Dr. Rohan',
              fees: '₹600',
              problem: 'Stomach Pain',
              doctorSuggestion: 'Take Digene and avoid oily food.',
            ),
          ],
        ),
      ),
    );
  }

  // Function to build appointment card
  Widget _buildAppointmentCard({
    required BuildContext context,
    required String appointmentDate,
    required String doctorName,
    required String fees,
    required String problem,
    required String doctorSuggestion,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to Appointment Details Screen with required arguments
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentDetailsScreen(
              appointmentDate: appointmentDate,
              doctorName: doctorName,
              fees: fees,
              problem: problem,
              doctorSuggestion: doctorSuggestion,
            ),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        shadowColor: Colors.blueAccent.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor's Name
              Text(
                '👨‍⚕️ $doctorName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),

              // Appointment Date
              Text(
                '📅 $appointmentDate',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),

              // Fees
              Text(
                '💸 Fees: $fees',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Problem
              Text(
                '🩺 Problem: $problem',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentDetailsScreen extends StatelessWidget {
  final String appointmentDate;
  final String doctorName;
  final String fees;
  final String problem;
  final String doctorSuggestion;

  const AppointmentDetailsScreen({
    required this.appointmentDate,
    required this.doctorName,
    required this.fees,
    required this.problem,
    required this.doctorSuggestion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Details',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.blueAccent.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          shadowColor: Colors.blueAccent.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor's Name
                Text(
                  '👨‍⚕️ Doctor: $doctorName',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 16),

                // Appointment Date
                Text(
                  '📅 Appointment Date:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  appointmentDate,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 16),

                // Fees
                Text(
                  '💸 Fees:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  fees,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                // Problem
                Text(
                  '🩺 Problem:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  problem,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 16),

                // Doctor's Suggestion
                Text(
                  '💡 Doctor\'s Suggestion:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  doctorSuggestion,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}