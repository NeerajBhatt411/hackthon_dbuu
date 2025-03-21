import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class PaymentDetailsScreen extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final String timeSlot;
  final String patientName;
  final String email;
  final String phone;
  final String timestamp;

  const PaymentDetailsScreen({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.timeSlot,
    required this.patientName,
    required this.email,
    required this.phone,
    required this.timestamp,
  });

  // Function to generate PDF bill
  Future<void> _generatePdf() async {
    try {
      // Create a PDF document
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Text('Appointment Bill',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    )),
                pw.SizedBox(height: 20),

                // Doctor Details
                pw.Text('Doctor: $doctorName',
                    style: pw.TextStyle(fontSize: 18)),
                pw.Text('Specialty: $doctorSpecialty',
                    style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 10),

                // Appointment Details
                pw.Text('Time Slot: $timeSlot',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('Patient: $patientName',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('Email: $email', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Phone: $phone', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Booked on: $timestamp',
                    style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),

                // Fees
                pw.Text('Fees: ₹500',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green,
                    )),
              ],
            );
          },
        ),
      );

      // Save the PDF to a file
      final output = await getTemporaryDirectory(); // Get temporary directory
      final file = File("${output.path}/appointment_bill.pdf"); // Create a file
      await file.writeAsBytes(await pdf.save()); // Save PDF bytes to the file

      // Open the PDF file
      OpenFile.open(file.path); // Open the saved PDF file
    } catch (e) {
      print('Error generating PDF: $e');
    }
  }

  // Function to handle payment
  void _handlePayment() {
    // Add your payment logic here
    print('Payment initiated...');
  }

  // Function to get a random color for cards
  Color _getRandomColor(int index) {
    final colors = [
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.purple.shade100,
      Colors.red.shade100,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Details Card
            Card(
              color: _getRandomColor(0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('👨‍⚕️ Doctor: $doctorName',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        )),
                    SizedBox(height: 8),
                    Text('🩺 Specialty: $doctorSpecialty',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Appointment Details Card
            Card(
              color: _getRandomColor(1),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⏰ Time Slot: $timeSlot',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    SizedBox(height: 8),
                    Text('👤 Patient: $patientName',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    SizedBox(height: 8),
                    Text('📧 Email: $email',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    SizedBox(height: 8),
                    Text('📞 Phone: $phone',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                    SizedBox(height: 8),
                    Text('📅 Booked on: $timestamp',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Fees Card
            Card(
              color: _getRandomColor(2),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Fees: ₹500',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Pay Now Button
            Center(
              child: ElevatedButton(
                onPressed: _handlePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Generate PDF Button
            Center(
              child: ElevatedButton(
                onPressed: _generatePdf,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Generate PDF Bill',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}