import 'package:equatable/equatable.dart';

abstract class FlightDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectSeatEvent extends FlightDetailsEvent {
  final int seatNumber;

  SelectSeatEvent(this.seatNumber);

  @override
  List<Object?> get props => [seatNumber];
}
