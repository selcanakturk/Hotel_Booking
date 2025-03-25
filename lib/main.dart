import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(HotelRezervationApp());
}

class HotelRezervationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
