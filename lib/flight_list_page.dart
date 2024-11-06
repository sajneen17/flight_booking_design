import 'package:flutter/material.dart';
import 'flight_details_page.dart' ;

class FlightListPage extends StatelessWidget {
  const FlightListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _buildDateSelector(),
              ],
            ),

            Container(
              color: Colors.teal[700],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Sort by:',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: 'Price',
                            dropdownColor: Colors.teal,
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            underline: const SizedBox(),
                            onChanged: (value) {},
                            items: ['Price', 'Duration', 'Airline'].map((String sortOption) {
                              return DropdownMenuItem<String>(
                                value: sortOption,
                                child: Text(
                                  sortOption,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const Icon(Icons.filter_list, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '12 flights available Sydney to London',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            // Flight Cards List
            Expanded(
              child: Container(
                color: Colors.teal[700],
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 2, // Sample data count
                  itemBuilder: (context, index) {
                    return _buildFlightCard(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          final dayOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
          final day = 16 + index;

          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: index == 2 ? Colors.teal[500] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    dayOfWeek,
                    style: TextStyle(color: index == 2 ? Colors.white : Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$day',
                    style: TextStyle(color: index == 2 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }


  Widget _buildFlightCard(BuildContext context) {
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
              _buildLocationDetail('Sydney', 'SYD'),
              const Spacer(),
              _buildLocationDetail('London', 'LCY'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Depart: 8:30 AM',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Text(
                'Flight No: EK008',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '\$790',
                style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              const Text(
                ' Ticket Price',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FlightDetailsPage()),
                  );
                },
                child: const Text(
                  'View Details',
                  style: TextStyle(color: Colors.teal, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationDetail(String city, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          code,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
