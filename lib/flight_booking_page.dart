import 'package:flutter/material.dart';
import 'flight_list_page.dart';



class FlightBookingPage extends StatefulWidget {
  const FlightBookingPage({super.key});
  @override
  FlightBookingPageState createState() => FlightBookingPageState();
}
class FlightBookingPageState extends State<FlightBookingPage> {
  String selectedFromCountry = 'Sydney (SYD)';
  String selectedToCountry = 'London (LCY)';
  DateTime selectedDate = DateTime.now();
  int selectedPassengers = 1;
  String selectedClass = 'Economy';
  bool isNonstop = false;
  bool isRoundTrip = true;
  final Map<String, String> countryMap = {
    'Sydney': 'SYD',
    'London': 'LCY',
    'New York': 'JFK',
    'Paris': 'CDG',
    'Tokyo': 'HND',
    'Dubai': 'DXB',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTripTypeButton('Round Trip', isRoundTrip, () {
                          setState(() => isRoundTrip = true);
                        }),
                        _buildTripTypeButton('One-Way', !isRoundTrip, () {
                          setState(() => isRoundTrip = false);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLocationSelection(),
                      const SizedBox(height: 16),
                      _buildDateSelection(),
                      const SizedBox(height: 16),
                      _buildPassengerSelection(),
                      const SizedBox(height: 16),
                      _buildClassSelection(),
                      const SizedBox(height: 16),
                      _buildNonstopToggle(),
                      const SizedBox(height: 16),
                      _buildSearchButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
  Widget _buildLocationSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLocationColumn('From', selectedFromCountry, Icons.flight_takeoff, (newValue) {
          setState(() => selectedFromCountry = newValue!);
        }),
        const Icon(Icons.airplanemode_active, color: Colors.orange),
        _buildLocationColumn('To', selectedToCountry, Icons.flight_land, (newValue) {
          setState(() => selectedToCountry = newValue!);
        }),
      ],
    );
  }
  Widget _buildLocationColumn(String label, String selectedValue, IconData icon, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
        const SizedBox(height: 4),
        DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
          underline: const SizedBox(),
          onChanged: onChanged,
          items: countryMap.entries.map<DropdownMenuItem<String>>((entry) {
            return DropdownMenuItem<String>(
              value: '${entry.key} (${entry.value})',
              child: Text('${entry.key} (${entry.value})'),
            );
          }).toList(),
        ),
      ],
    );
  }
  Widget _buildDateSelection() {
    return Row(
      children: [
        const Icon(Icons.calendar_today, color: Colors.teal),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Text(
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        const Spacer(),
        if (isRoundTrip) const Text('Return', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
  Widget _buildPassengerSelection() {
    return Row(
      children: [
        const Icon(Icons.person, color: Colors.teal),
        const SizedBox(width: 8),
        const Text(
          'Passenger & Luggage',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        const Spacer(),
        DropdownButton<int>(
          value: selectedPassengers,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
          underline: const SizedBox(),
          onChanged: (newValue) {
            setState(() => selectedPassengers = newValue!);
          },
          items: List.generate(10, (index) => index + 1).map((value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value'),
            );
          }).toList(),
        ),
      ],
    );
  }
  Widget _buildClassSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Class', style: TextStyle(color: Colors.black, fontSize: 16)),
        Row(
          children: [
            _buildClassOption('Economy', Icons.airline_seat_recline_normal),
            const SizedBox(width: 8),
            _buildClassOption('Business', Icons.airline_seat_legroom_extra),
            const SizedBox(width: 8),
            _buildClassOption('Elite', Icons.airline_seat_flat),
          ],
        ),
      ],
    );
  }
  Widget _buildClassOption(String label, IconData icon) {
    bool isSelected = selectedClass == label;
    return GestureDetector(
      onTap: () {
        setState(() => selectedClass = label);
      },
      child: Column(
        children: [
          Icon(icon, color: isSelected ? Colors.teal : Colors.grey),
          Text(
            label,
            style: TextStyle(color: isSelected ? Colors.teal : Colors.grey),
          ),
        ],
      ),
    );
  }
  Widget _buildNonstopToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Nonstop flights first',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        Switch(
          value: isNonstop,
          onChanged: (value) {
            setState(() => isNonstop = value);
          },
          activeColor: Colors.orange,
        ),
      ],
    );
  }
  Widget _buildSearchButton() {
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() => selectedDate = pickedDate);
    }
  }
}