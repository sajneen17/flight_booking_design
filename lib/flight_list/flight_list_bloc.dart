import 'package:flutter_bloc/flutter_bloc.dart';
import 'flight_list_event.dart';
import 'flight_list_state.dart';

class FlightListBloc extends Bloc<FlightListEvent, FlightListState> {
  FlightListBloc()
      : super(FlightListState(
    selectedDate: DateTime.now(),
    flights: [
      Flight("Sydney", "London", "8:30 AM", "EK008", 790.0),
      Flight("Sydney", "New York", "9:30 AM", "EK102", 950.0),
    ],
  )) {
    on<SelectDate>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });

    on<SortFlights>((event, emit) {
      List<Flight> sortedFlights = List.from(state.flights);
      if (event.sortBy == 'Price') {
        sortedFlights.sort((a, b) => a.price.compareTo(b.price));
      } else if (event.sortBy == 'Duration') {
        sortedFlights.sort((a, b) => a.time.compareTo(b.time));
      }
      emit(state.copyWith(sortBy: event.sortBy, flights: sortedFlights));
    });
  }
}
