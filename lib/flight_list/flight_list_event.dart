import 'package:equatable/equatable.dart';

abstract class FlightListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectDate extends FlightListEvent {
  final DateTime date;
  SelectDate(this.date);

  @override
  List<Object?> get props => [date];
}

class SortFlights extends FlightListEvent {
  final String sortBy;
  SortFlights(this.sortBy);

  @override
  List<Object?> get props => [sortBy];
}
