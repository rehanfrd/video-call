import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const ZingCallApp());
}

class ZingCallApp extends StatelessWidget {
  const ZingCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZingCall',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(primary: Color(0xFF38BDF8)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final callIdController = TextEditingController(text: "room1");
  final userId = Random().nextInt(10000).toString();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZingCall 📞', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.video_camera_front_rounded, size: 80, color: Color(0xFF38BDF8)),
            const SizedBox(height: 20),
            Text('Your User ID: User_$userId', style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 20),
            TextField(
              controller: callIdController,
              decoration: InputDecoration(
                labelText: 'Enter Call ID (e.g., room1)',
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38BDF8),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallPage(
                      callID: callIdController.text,
                      userID: userId,
                      userName: "User_$userId",
                    ),
                  ),
                );
              },
              child: const Text('JOIN CALL 🚀', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callID;
  final String userID;
  final String userName;

  const CallPage({
    super.key,
    required this.callID,
    required this.userID,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: 1413274594, 
        appSign: "b29585a1e133bc2edd9a0c1cb7b65e961ebfc00b4710e9dfeb79de6eae559a20",
        userID: userID,
        userName: userName,
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    
    );
  }
}
