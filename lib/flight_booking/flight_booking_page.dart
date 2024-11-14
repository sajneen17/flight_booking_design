import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_booking_design/flight_list/flight_list_page.dart';
import 'flight_booking_bloc.dart';
import 'flight_booking_event.dart';
import 'flight_booking_state.dart';

class FlightBookingPage extends StatelessWidget {
  final Map<String, String> countryMap = {
    'Sydney': 'SYD',
    'London': 'LCY',
    'New York': 'JFK',
    'Paris': 'CDG',
    'Tokyo': 'HND',
    'Dubai': 'DXB',
  };

  FlightBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FlightBookingBloc(),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<FlightBookingBloc, FlightBookingState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLocationDropdown(
                              context,
                              label: 'From',
                              selectedValue: state.fromCountry,
                              onChanged: (newCountry) {
                                context.read<FlightBookingBloc>().add(SelectFromCountry(newCountry!));
                              },
                            ),
                            const SizedBox(height: 16),
                            _buildLocationDropdown(
                              context,
                              label: 'To',
                              selectedValue: state.toCountry,
                              onChanged: (newCountry) {
                                context.read<FlightBookingBloc>().add(SelectToCountry(newCountry!));
                              },
                            ),
                            const SizedBox(height: 16),
                            _buildDatePicker(context, state),
                            const SizedBox(height: 16),
                            _buildPassengerSelector(context, state),
                            const SizedBox(height: 16),
                            _buildClassSelector(context, state),
                            const SizedBox(height: 24),
                            _buildSearchButton(context),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.teal[700],
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book your Flight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<FlightBookingBloc, FlightBookingState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTripTypeButton('Round Trip', state.isRoundTrip, () {
                      context.read<FlightBookingBloc>().add(const ToggleTripType(true));
                    }),
                    _buildTripTypeButton('One-Way', !state.isRoundTrip, () {
                      context.read<FlightBookingBloc>().add(const ToggleTripType(false));
                    }),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDropdown(
      BuildContext context, {
        required String label,
        required String? selectedValue,
        required ValueChanged<String?> onChanged,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedValue,
          hint: Text('Select $label'),
          items: countryMap.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Text(entry.key),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context, FlightBookingState state) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: state.date,
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        );
        if (selectedDate != null) {
          context.read<FlightBookingBloc>().add(SelectDate(selectedDate));
        }
      },
      child: Text(
        'Date: ${state.date.toLocal()}'.split(' ')[0],
        style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildPassengerSelector(BuildContext context, FlightBookingState state) {
    return Row(
      children: [
        const Text('Passengers', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        DropdownButton<int>(
          value: state.passengers,
          items: List.generate(10, (index) => index + 1)
              .map((passengerCount) => DropdownMenuItem(
            value: passengerCount,
            child: Text(passengerCount.toString()),
          ))
              .toList(),
          onChanged: (newCount) {
            if (newCount != null) {
              context.read<FlightBookingBloc>().add(SelectPassengers(newCount));
            }
          },
        ),
      ],
    );
  }

  Widget _buildClassSelector(BuildContext context, FlightBookingState state) {
    return Row(
      children: [
        const Text('Class', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        DropdownButton<String>(
          value: state.flightClass,
          items: ['Economy', 'Business', 'First']
              .map((classType) => DropdownMenuItem(
            value: classType,
            child: Text(classType),
          ))
              .toList(),
          onChanged: (newClass) {
            if (newClass != null) {
              context.read<FlightBookingBloc>().add(SelectClass(newClass));
            }
          },
        ),
      ],
    );
  }

  Widget _buildTripTypeButton(String title, bool isSelected, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return SizedBox(
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
            MaterialPageRoute(builder: (context) => const FlightListPage()),
          );
        },
        child: const Text(
          'Search Flights',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
