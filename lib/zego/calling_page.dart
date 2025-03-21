// import 'package:flutter/material.dart';
// import 'package:untitled2/zego/constants.dart';
// import 'dart:math';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
//
// class CallingPage extends StatefulWidget {
//   final String callID;
//
//   const CallingPage({super.key,required this.callID});
//
//   @override
//   State<CallingPage> createState() => _CallingPageState();
// }
//
// class _CallingPageState extends State<CallingPage> {
//   @override
//   Widget build(BuildContext context) {
//     final userId = Random().nextInt(10000);
//     return ZegoUIKitPrebuiltCall(
//       appID: AppInfo.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
//       appSign: AppInfo.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
//       userID: userId.toString(),
//       userName: 'user_name$userId',
//       callID: widget.callID,
//       // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
//       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
//     );
//   }
// }
