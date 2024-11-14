import 'package:equatable/equatable.dart';

class FlightDetailsState extends Equatable {
  final int? selectedSeat;

  const FlightDetailsState({this.selectedSeat});

  FlightDetailsState copyWith({int? selectedSeat}) {
    return FlightDetailsState(
      selectedSeat: selectedSeat ?? this.selectedSeat,
    );
  }

  @override
  List<Object?> get props => [selectedSeat];
}
