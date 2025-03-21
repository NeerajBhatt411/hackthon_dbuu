// import 'package:flutter/material.dart';
// import 'package:untitled2/zego/calling_page.dart';
// import 'calling_page.dart';
//
// class CallingMain extends StatefulWidget {
//   const CallingMain({super.key});
//
//   @override
//   State<CallingMain> createState() => _CallingMainState();
// }
//
// class _CallingMainState extends State<CallingMain> {
//   TextEditingController _textEditingController=  TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text("Video Call"),
//         ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextField(
//                 controller: _textEditingController,
//                 decoration: InputDecoration(
//                   labelText: "Enter call id to join ",
//                   border: OutlineInputBorder()
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CallingPage(callID: _textEditingController),));
//             }, child: Text("Join"))
//           ],
//         ),
//       ),
//     );
//   }
// }
