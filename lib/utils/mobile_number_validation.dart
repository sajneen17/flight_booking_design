String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your contact number';
  }
  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Enter a valid 10-digit contact number';
  }
  return null;
}
