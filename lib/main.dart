/*
Application ot demonstrate the use of:
  - dropdown widget
  - radio buttons
  - checkboxes
The application allows the user to select a car model, warranty year and the option
to add car insurance. It then calculates the total car price.
 */
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'csci410 week 6',
      home: Home() // calls the main page to display the application interface
    );
  }
}
