import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_booking_design/flight_details/flight_details_page.dart';
import 'flight_list_bloc.dart';
import 'flight_list_event.dart';
import 'flight_list_state.dart';

class FlightListPage extends StatelessWidget {
  const FlightListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightListBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Custom AppBar with Title and Date Selector
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Flights",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  _buildDateSelector(context),
                ],
              ),
              _buildSortOptions(context),
              // Flight Cards List
              Expanded(
                child: Container(
                  color: Colors.teal[700],
                  child: BlocBuilder<FlightListBloc, FlightListState>(
                    builder: (context, state) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.flights.length,
                        itemBuilder: (context, index) {
                          return _buildFlightCard(context, state.flights[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          final dayOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
          final day = DateTime.now().day + index;
          final selectedDate = DateTime(DateTime.now().year, DateTime.now().month, day);

          return GestureDetector(
            onTap: () {
              context.read<FlightListBloc>().add(SelectDate(selectedDate));
            },
            child: BlocBuilder<FlightListBloc, FlightListState>(
              builder: (context, state) {
                bool isSelected = state.selectedDate.day == day;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal[500] : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        dayOfWeek,
                        style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$day',
                        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSortOptions(BuildContext context) {
    return Container(
      color: Colors.teal[700],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Sort by:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 8),
              BlocBuilder<FlightListBloc, FlightListState>(
                builder: (context, state) {
                  return DropdownButton<String>(
                    value: state.sortBy,
                    dropdownColor: Colors.teal,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: const SizedBox(),
                    onChanged: (value) {
                      if (value != null) {
                        context.read<FlightListBloc>().add(SortFlights(value));
                      }
                    },
                    items: ['Price', 'Duration', 'Airline'].map((String sortOption) {
                      return DropdownMenuItem<String>(
                        value: sortOption,
                        child: Text(
                          sortOption,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
          const Icon(Icons.filter_list, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildFlightCard(BuildContext context, Flight flight) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildLocationDetail(flight.from),
              const Spacer(),
              _buildLocationDetail(flight.to),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Depart: ${flight.time}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              Text('Flight No: ${flight.flightNumber}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$${flight.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FlightDetailsPage()));
                },
                child: const Text('View Details', style: TextStyle(color: Colors.teal, fontSize: 14)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationDetail(String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          location.substring(0, 3).toUpperCase(),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
