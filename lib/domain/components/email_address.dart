class EmailAddress {
  final String value;

  EmailAddress._(this.value);

  static EmailAddress? tryParse(String input) {
    final trimmed = input.trim();
    final emailReg = RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$");
    if (emailReg.hasMatch(trimmed)) {
      return EmailAddress._(trimmed);
    }
    return null;
  }
}