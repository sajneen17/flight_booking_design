String? validateCardNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your card number';
  }
  if (!RegExp(r'^[0-9]{16}$').hasMatch(value)) {
    return 'Enter a valid 16-digit card number';
  }
  return null;
}
