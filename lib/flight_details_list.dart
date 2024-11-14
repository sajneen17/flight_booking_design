import 'package:flutter/material.dart';
import 'checkout_page.dart';


class FlightDetailsPage extends StatefulWidget {
  const FlightDetailsPage({super.key});
  @override
  FlightDetailsPageState createState() => FlightDetailsPageState();
}


class FlightDetailsPageState extends State<FlightDetailsPage> {
  int? selectedSeat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight details'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.teal[700],
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sydney (SYD)', style: TextStyle(color: Colors.white, fontSize: 18)),
                        Icon(Icons.flight, color: Colors.white, size: 16),
                        Text('London (LCY)', style: TextStyle(color: Colors.white, fontSize: 18)),
                        Text('Depart\n8:30 AM', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text('Flight No\nEK008', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text('Traveller\n01', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text('Seat No\n17', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text('Ticket Price\n\$790', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const Text('Economy Class', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const Text('Select a seat', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Expanded(
                          child: GridView.builder(
                            itemCount: 30,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 8, crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              bool isSelected = selectedSeat == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSeat = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected ? Colors.orange : Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}