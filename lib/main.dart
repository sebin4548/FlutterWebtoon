import 'package:flutter/material.dart';
import 'package:testproject/screens/home_screen.dart';

void main() {
  runApp(const App());
  // say(age: 22);
  // print("dddd");
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
