// flight_booking_state.dart
import 'package:equatable/equatable.dart';

class FlightBookingState extends Equatable {
  final String fromCountry;
  final String toCountry;
  final DateTime date;
  final int passengers;
  final String flightClass;
  final bool isNonstop;
  final bool isRoundTrip;

  const FlightBookingState({
    this.fromCountry = 'Sydney (SYD)',
    this.toCountry = 'London (LCY)',
    required this.date,
    this.passengers = 1,
    this.flightClass = 'Economy',
    this.isNonstop = false,
    this.isRoundTrip = true,
  });

  FlightBookingState copyWith({
    String? fromCountry,
    String? toCountry,
    DateTime? date,
    int? passengers,
    String? flightClass,
    bool? isNonstop,
    bool? isRoundTrip,
  }) {
    return FlightBookingState(
      fromCountry: fromCountry ?? this.fromCountry,
      toCountry: toCountry ?? this.toCountry,
      date: date ?? this.date,
      passengers: passengers ?? this.passengers,
      flightClass: flightClass ?? this.flightClass,
      isNonstop: isNonstop ?? this.isNonstop,
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
    );
  }

  @override
  List<Object?> get props => [fromCountry, toCountry, date, passengers, flightClass, isNonstop, isRoundTrip];
}

