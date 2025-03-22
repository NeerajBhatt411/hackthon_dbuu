import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'doctor_detail.dart';


class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  void _launchVideoConsultation() async {
    final Uri url = Uri.parse('https://meet.google.com/xhu-ctza-xok');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget _buildDoctorCategory(BuildContext context, String imagePath, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        width: 110,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.contain),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: [
                  _buildDoctorCategory(context, 'assets/icons/img1.png', 'General Physician', DoctorDetailScreen()),
              SizedBox(width: 10),
              _buildDoctorCategory(context, 'assets/icons/img4.png', 'Skin & Hair', DoctorDetailScreen()),
              SizedBox(width: 10),
              _buildDoctorCategory(context, 'assets/icons/img3.png', 'Women Health', DoctorDetailScreen()),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchVideoConsultation,
              child: Text('Start Video Consultation'),
            ),
          ],
        ),
      ),
    );
  }
}
