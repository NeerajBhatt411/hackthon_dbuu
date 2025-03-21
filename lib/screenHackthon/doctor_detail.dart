import 'package:flutter/material.dart';

import '../util/app_theme.dart';

class DocotorDetail extends StatefulWidget {
  const DocotorDetail({super.key});

  @override
  State<DocotorDetail> createState() => _DocotorDetailState();
}

class _DocotorDetailState extends State<DocotorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor Detail",
          style: TextStyle(
              color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffd1e8f1),
      ),
    );
  }
}
