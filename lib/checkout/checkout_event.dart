import 'package:equatable/equatable.dart';

abstract class CheckoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CardHolderChanged extends CheckoutEvent {
  final String cardHolder;
  CardHolderChanged(this.cardHolder);

  @override
  List<Object?> get props => [cardHolder];
}

class CardNumberChanged extends CheckoutEvent {
  final String cardNumber;
  CardNumberChanged(this.cardNumber);

  @override
  List<Object?> get props => [cardNumber];
}

class ExpiryDateChanged extends CheckoutEvent {
  final String expiryDate;
  ExpiryDateChanged(this.expiryDate);

  @override
  List<Object?> get props => [expiryDate];
}

class CVVChanged extends CheckoutEvent {
  final String cvv;
  CVVChanged(this.cvv);

  @override
  List<Object?> get props => [cvv];
}

class SubmitCheckout extends CheckoutEvent {}
