class Password {
  final String value;

  Password._(this.value);

  static Password? tryCreate(String input) {
    final trimmed = input.trim();
    if (trimmed.length >= 6) {
      return Password._(trimmed);
    }
    return null;
  }
}