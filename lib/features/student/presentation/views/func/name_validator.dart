String? nameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your full name';
  }
  List<String> names = value.split(' ');
  if (names.length != 4) {
    return 'Please enter your full name';
  }
  return null;
}
