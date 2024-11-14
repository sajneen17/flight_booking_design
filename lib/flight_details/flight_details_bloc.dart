import 'package:flutter_bloc/flutter_bloc.dart';
import 'flight_details_event.dart';
import 'flight_details_state.dart';

class FlightDetailsBloc extends Bloc<FlightDetailsEvent, FlightDetailsState> {
  FlightDetailsBloc() : super(const FlightDetailsState()) {
    on<SelectSeatEvent>((event, emit) {
      emit(state.copyWith(selectedSeat: event.seatNumber));
    });
  }
}
