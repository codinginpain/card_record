import 'package:card_record/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // backgroundColor: const Color(0xFFE7626C),
        backgroundColor: const Color(0xff515830),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
