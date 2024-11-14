import 'package:flutter_bloc/flutter_bloc.dart';
import 'flight_booking_event.dart';
import 'flight_booking_state.dart';

class FlightBookingBloc extends Bloc<FlightBookingEvent, FlightBookingState> {
  FlightBookingBloc()
      : super(FlightBookingState(date: DateTime.now())) {
    on<SelectFromCountry>((event, emit) => emit(state.copyWith(fromCountry: event.fromCountry)));
    on<SelectToCountry>((event, emit) => emit(state.copyWith(toCountry: event.toCountry)));
    on<SelectDate>((event, emit) => emit(state.copyWith(date: event.date)));
    on<SelectPassengers>((event, emit) => emit(state.copyWith(passengers: event.passengers)));
    on<SelectClass>((event, emit) => emit(state.copyWith(flightClass: event.flightClass)));
    on<ToggleNonstop>((event, emit) => emit(state.copyWith(isNonstop: event.isNonstop)));
    on<ToggleTripType>((event, emit) => emit(state.copyWith(isRoundTrip: event.isRoundTrip)));
  }
}

