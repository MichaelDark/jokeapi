/// Joke flag (a.k.a. blacklist flag).
enum JokeFlag {
  /// Not Safe For Work.
  nsfw(code: 'nsfw'),

  /// Religious jokes.
  religious(code: 'religious'),

  /// Politically incorrect jokes.
  political(code: 'political'),

  /// Racist jokes.
  racist(code: 'racist'),

  /// Sexist jokes.
  sexist(code: 'sexist'),

  /// Explicit jokes.
  explicit(code: 'explicit');

  /// Flag code
  final String code;

  const JokeFlag({required this.code});
}
