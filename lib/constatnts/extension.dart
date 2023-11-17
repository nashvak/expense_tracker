extension StringExtension on String {
  // A custom method to capitalize the first letter of a string
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
