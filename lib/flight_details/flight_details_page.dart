import 'package:flutter/material.dart';
import 'package:flight_booking_design/checkout/checkout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'flight_details_bloc.dart';
import 'flight_details_event.dart';
import 'flight_details_state.dart';

class FlightDetailsPage extends StatelessWidget {
  const FlightDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightDetailsBloc(),
      child: Scaffold(
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
                    _buildFlightInfo(),
                    _buildSeatSelection(context),
                  ],
                ),
              ),
            ),
            _buildCheckoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightInfo() {
    return const Expanded(
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
    );
  }

  Widget _buildSeatSelection(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          const Text('Economy Class', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Select a seat', style: TextStyle(color: Colors.white70, fontSize: 14)),
          Expanded(
            child: BlocBuilder<FlightDetailsBloc, FlightDetailsState>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 8, crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    bool isSelected = state.selectedSeat == index;
                    return GestureDetector(
                      onTap: () {
                        context.read<FlightDetailsBloc>().add(SelectSeatEvent(index));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return Padding(
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
    );
  }
}
