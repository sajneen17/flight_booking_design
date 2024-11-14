import 'package:equatable/equatable.dart';

class Flight {
  final String from;
  final String to;
  final String time;
  final String flightNumber;
  final double price;

  Flight(this.from, this.to, this.time, this.flightNumber, this.price);
}

class FlightListState extends Equatable {
  final DateTime selectedDate;
  final String sortBy;
  final List<Flight> flights;

  const FlightListState({
    required this.selectedDate,
    this.sortBy = 'Price',
    this.flights = const [],
  });

  FlightListState copyWith({
    DateTime? selectedDate,
    String? sortBy,
    List<Flight>? flights,
  }) {
    return FlightListState(
      selectedDate: selectedDate ?? this.selectedDate,
      sortBy: sortBy ?? this.sortBy,
      flights: flights ?? this.flights,
    );
  }

  @override
  List<Object?> get props => [selectedDate, sortBy, flights];
}
