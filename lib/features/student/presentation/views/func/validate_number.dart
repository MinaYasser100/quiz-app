String? validateNumeric(value) {
  if (value.isEmpty) {
    return 'Please enter a number';
  }

  // Check if the value is numeric
  if (double.tryParse(value) == null) {
    return 'Please enter a valid number';
  }

  return null;
}
