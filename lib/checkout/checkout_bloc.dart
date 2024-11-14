import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutState()) {
    on<CardHolderChanged>((event, emit) {
      emit(state.copyWith(cardHolder: event.cardHolder));
    });
    on<CardNumberChanged>((event, emit) {
      emit(state.copyWith(cardNumber: event.cardNumber));
    });
    on<ExpiryDateChanged>((event, emit) {
      emit(state.copyWith(expiryDate: event.expiryDate));
    });
    on<CVVChanged>((event, emit) {
      emit(state.copyWith(cvv: event.cvv));
    });

    on<SubmitCheckout>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));


      await Future.delayed(const Duration(seconds: 2));


      emit(state.copyWith(isSubmitting: false));
    });
  }
}
