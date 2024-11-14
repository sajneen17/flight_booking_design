String? validateEmail(String? value) {
  const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
  final emailRegExp = RegExp(emailPattern);

  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}
