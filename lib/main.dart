import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAFgc4Yb76b8yYsCMjTc5dmhlQg564dnag',
          appId: '1:593199063709:android:c10875043b444d85b72a74',
          messagingSenderId: '593199063709',
          projectId: 'fir-crud-e7e9a'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
