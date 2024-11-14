import 'package:equatable/equatable.dart';

class CheckoutState extends Equatable {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final bool isValid;
  final bool isSubmitting;
  final String? errorMessage;

  const CheckoutState({
    this.cardHolder = '',
    this.cardNumber = '',
    this.expiryDate = '',
    this.cvv = '',
    this.isValid = false,
    this.isSubmitting = false,
    this.errorMessage,
  });

  CheckoutState copyWith({
    String? cardHolder,
    String? cardNumber,
    String? expiryDate,
    String? cvv,
    bool? isValid,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return CheckoutState(
      cardHolder: cardHolder ?? this.cardHolder,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [cardHolder, cardNumber, expiryDate, cvv, isValid, isSubmitting, errorMessage];
}
