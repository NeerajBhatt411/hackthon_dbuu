import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/doctor_detail.dart';
import 'package:untitled2/util/app_theme.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final Map<int, bool> _hoverStates = {};

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home ",
            style: TextStyle(
                color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffd1e8f1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffd1e8f1), Color(0xffe6f4f9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildOptionCard(
                            index: 0,
                            imagePath: 'assets/icons/patienthome.png',
                            title: 'Book In-Clinic Appointment',
                          ),
                        ),
                        Expanded(
                          child: _buildOptionCard(
                            index: 1,
                            imagePath: 'assets/icons/Image (1).png',
                            title: 'Instant Video Consultation',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: screenHeight * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Center(child: Icon(Icons.search)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Search for Docotor",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: screenWidth * 0.15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Find Docotor For Your Health Problem",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));
                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img1.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'General Physician',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));

                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img4.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Skin &     hair ',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));

                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img3.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Womens Health",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));

                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img5.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Dental    Care',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));
                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img6.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Child Specialist',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocotorDetail(),));
                        },
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.blueGrey[50], // Light background color
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/img7.png', // Replace with your image path
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Ear,Nose Throat',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
      {required int index, required String imagePath, required String title}) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverStates[index] = true),
      onExit: (_) => setState(() => _hoverStates[index] = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
          gradient: (_hoverStates[index] ?? false)
              ? LinearGradient(
                  colors: [Colors.blue.shade50, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 10),
            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
