import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:versus_admin/screens/main_sreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(  options: FirebaseOptions(
    apiKey: "AIzaSyBkQ44ebLlNiebDeZpG32WP6A7BOcmrZOs",
    appId: "1:1082472984094:web:2e5f49a18c38d4ad08080f",
    messagingSenderId: "1082472984094",
    projectId: "versus-8b749",
    storageBucket: "versus-8b749.appspot.com",
  ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
