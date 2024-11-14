import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const FlightBooking());
}

class FlightBooking extends StatelessWidget {
  const FlightBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
