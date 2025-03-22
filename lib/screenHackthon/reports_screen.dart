import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medical Reports',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 8,
        shadowColor: Colors.tealAccent.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReportCard(
              context,
              date: 'Oct 10, 2025',
              doctor: 'Dr. Sharma',
              cost: '₹500',
              issue: 'Cold & Fever',
              advice: 'Take prescribed medication and rest well.',
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              context,
              date: 'Oct 15, 2025',
              doctor: 'Dr. Mehta',
              cost: '₹700',
              issue: 'Back Ache',
              advice: 'Regular stretching and avoid heavy loads.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
      BuildContext context, {
        required String date,
        required String doctor,
        required String cost,
        required String issue,
        required String advice,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetailScreen(
              date: date,
              doctor: doctor,
              cost: cost,
              issue: issue,
              advice: advice,
            ),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        shadowColor: Colors.teal.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '👨‍⚕️ Dr. $doctor',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              Text('📅 Date: $date'),
              const SizedBox(height: 8),
              Text('💰 Cost: $cost',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Text('🩺 Issue: $issue'),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDetailScreen extends StatelessWidget {
  final String date;
  final String doctor;
  final String cost;
  final String issue;
  final String advice;

  const ReportDetailScreen({
    required this.date,
    required this.doctor,
    required this.cost,
    required this.issue,
    required this.advice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doctor: $doctor', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Date: $date'),
                const SizedBox(height: 10),
                Text('Cost: $cost', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Issue: $issue'),
                const SizedBox(height: 10),
                Text('Advice: $advice', style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}