import 'package:flutter/material.dart';
import './screens/first_screen.dart';

void main() {
  runApp(PlantIOApp());
}



class PlantIOApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}




