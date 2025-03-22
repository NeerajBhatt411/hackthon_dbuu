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
                pw.Text('Appointment Invoice',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    )),
                pw.SizedBox(height: 20),
                pw.Text('Doctor: $doctorName', style: pw.TextStyle(fontSize: 18)),
                pw.Text('Specialization: $doctorSpecialty', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 10),
                pw.Text('Time Slot: $timeSlot', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Patient: $patientName', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Email: $email', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Contact: $phone', style: pw.TextStyle(fontSize: 16)),
                pw.Text('Appointment Date: $timestamp', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
                pw.Text('Consultation Fees: ₹500',
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
      final file = File("${output.path}/appointment_invoice.pdf");
      await file.writeAsBytes(await pdf.save());
      await OpenFile.open(file.path);
    } catch (e) {
      print('Error creating PDF: $e');
    }
  }

  void _processPayment() async {
    final String upiId = "neerajbhattadx@oksbi";
    final Uri paymentUrl = Uri.parse(
        "upi://pay?pa=$upiId&pn=Doctor%20Fees&mc=0000&tid=987654&tr=987654&tn=Doctor%20Consultation%20Fee&am=500&cu=INR");

    if (await canLaunchUrl(paymentUrl)) {
      await launchUrl(paymentUrl);
    } else {
      print("Unable to launch payment URL");
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
            _buildInfoCard('👨‍⚕️ Doctor', doctorName, '🩺 Specialization', doctorSpecialty),
            SizedBox(height: 20),
            _buildInfoCard('⏰ Time Slot', timeSlot, '👤 Patient', patientName,
                additionalDetails: {'📧 Email': email, '📞 Contact': phone, '📅 Appointment Date': timestamp}),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Proceed to Payment', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _generatePdf,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text('Download Invoice', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title1, String value1, String title2, String value2, {Map<String, String>? additionalDetails}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title1: $value1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('$title2: $value2', style: TextStyle(fontSize: 16)),
            if (additionalDetails != null)
              ...additionalDetails.entries.map(
                    (entry) => Text('${entry.key}: ${entry.value}', style: TextStyle(fontSize: 16)),
              ),
          ],
        ),
      ),
    );
  }
}