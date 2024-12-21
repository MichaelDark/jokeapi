/// Type of the joke.
enum JokeType {
  /// Simple joke.
  single(code: 'single'),

  /// Two-part joke consisting of setup and delivery
  twoPart(code: 'twopart');

  /// Joke Type code
  final String code;

  const JokeType({required this.code});
}
