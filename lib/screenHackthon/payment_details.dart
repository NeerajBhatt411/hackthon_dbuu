import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _generatePdf() async {
    try {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Appointment Bill',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    )),
                pw.SizedBox(height: 20),
                pw.Text('Doctor: $doctorName', style: pw.TextStyle(fontSize: 18)),
                pw.Text('Specialty: $doctorSpecialty', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 10),
                pw.Text('Time Slot: $timeSlot', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Patient: $patientName', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Email: $email', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Phone: $phone', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Booked on: $timestamp', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
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

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/appointment_bill.pdf");
      await file.writeAsBytes(await pdf.save());

      // Open the file
      await OpenFile.open(file.path);

    } catch (e) {
      print('Error generating PDF: $e');
    }
  }

  void _handlePayment() async {
    final String upiId = "neerajbhattadx@oksbi";
    final Uri upiUrl = Uri.parse(
        "upi://pay?pa=$upiId&pn=Doctor Payment&mc=0000&tid=123456&tr=123456&tn=Doctor Appointment Fees&am=500&cu=INR");

    if (await canLaunchUrl(upiUrl)) {
      await launchUrl(upiUrl);
    } else {
      print("Could not launch UPI payment");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Details'), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('👨‍⚕️ Doctor: $doctorName', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('🩺 Specialty: $doctorSpecialty', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⏰ Time Slot: $timeSlot', style: TextStyle(fontSize: 16)),
                    Text('👤 Patient: $patientName', style: TextStyle(fontSize: 16)),
                    Text('📧 Email: $email', style: TextStyle(fontSize: 16)),
                    Text('📞 Phone: $phone', style: TextStyle(fontSize: 16)),
                    Text('📅 Booked on: $timestamp', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _handlePayment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Pay Now', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _generatePdf,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text('Generate PDF Bill', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
