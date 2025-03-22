import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for phone call

class ClinicAppointment extends StatefulWidget {
  const ClinicAppointment({super.key});

  @override
  State<ClinicAppointment> createState() => _ClinicAppointmentState();
}

class _ClinicAppointmentState extends State<ClinicAppointment> {
  // Function to make a call
  void _makePhoneCall() async {
    const phoneNumber = 'tel:7698810025';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic Details", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/icons/profile.png'), // Dummy doctor image
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Himanshu Sharma",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Cardiologist | MBBS, MD",
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 8),

                      // Clinic Address
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.redAccent),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Himanshu Heart Clinic, Rajpur Road, Dehradun - 248001",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Opening Hours
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(
                            "Mon - Sat: 9:00 AM - 5:00 PM",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Call Now Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: _makePhoneCall,
                  icon: Icon(Icons.phone, color: Colors.white),
                  label: Text(
                    "Call Now",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
