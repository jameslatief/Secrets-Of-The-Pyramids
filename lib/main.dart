import 'package:flutter/material.dart';
import 'package:destini_challenge_starting/screens/cover_screen.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CoverScreen(),
    );
  }
}
