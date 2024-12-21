/// Category of the joke.
enum JokeCategory {
  /// Any kind of a joke.
  any(code: 'Any'),

  /// Miscellaneous jokes.
  misc(code: 'Misc', aliases: ['Miscellaneous']),

  /// Programming-related jokes.
  programming(code: 'Programming', aliases: ['Coding', 'Development']),

  /// Dark humor.
  dark(code: 'Dark'),

  /// Puns.
  pun(code: 'Pun'),

  /// Spooky/creepy jokes.
  spooky(code: 'Spooky', aliases: ['Halloween']),

  /// Xmas jokes.
  christmas(code: 'Christmas');

  /// Category code
  final String code;

  /// Category Aliases
  final List<String> aliases;

  const JokeCategory({required this.code, this.aliases = const []});
}
