import 'package:flutter/material.dart';
import 'package:hava_durumu_uygulamasi/screens/loading_screen.dart';
import 'package:hava_durumu_uygulamasi/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hava Durumu Uygulaması',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
