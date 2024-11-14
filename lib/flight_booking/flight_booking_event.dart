import 'package:equatable/equatable.dart';

abstract class FlightBookingEvent extends Equatable {
  const FlightBookingEvent();

  @override
  List<Object?> get props => [];
}

class SelectFromCountry extends FlightBookingEvent {
  final String fromCountry;
  const SelectFromCountry(this.fromCountry);

  @override
  List<Object?> get props => [fromCountry];
}

class SelectToCountry extends FlightBookingEvent {
  final String toCountry;
  const SelectToCountry(this.toCountry);

  @override
  List<Object?> get props => [toCountry];
}

class SelectDate extends FlightBookingEvent {
  final DateTime date;
  const SelectDate(this.date);

  @override
  List<Object?> get props => [date];
}

class SelectPassengers extends FlightBookingEvent {
  final int passengers;
  const SelectPassengers(this.passengers);

  @override
  List<Object?> get props => [passengers];
}

class SelectClass extends FlightBookingEvent {
  final String flightClass;
  const SelectClass(this.flightClass);

  @override
  List<Object?> get props => [flightClass];
}

class ToggleNonstop extends FlightBookingEvent {
  final bool isNonstop;
  const ToggleNonstop(this.isNonstop);

  @override
  List<Object?> get props => [isNonstop];
}

class ToggleTripType extends FlightBookingEvent {
  final bool isRoundTrip;
  const ToggleTripType(this.isRoundTrip);

  @override
  List<Object?> get props => [isRoundTrip];
}

