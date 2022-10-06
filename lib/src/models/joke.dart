class Joke {
  final String category;
  final String type;
  final Flags flags;
  final int id;
  final bool safe;
  final String lang;

  final SingleJoke? singleJoke;
  final TwoPartJoke? twoPartJoke;

  const Joke({
    required this.category,
    required this.type,
    this.singleJoke,
    this.twoPartJoke,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });

  static Joke fromJson(Map<String, dynamic> json) {
    final joke = Joke(
      category: json['category'],
      type: json['type'],
      singleJoke: SingleJoke.tryFromJson(json),
      twoPartJoke: TwoPartJoke.tryFromJson(json),
      flags: Flags.fromJson(json),
      id: json['id'],
      safe: json['safe'],
      lang: json['lang'],
    );

    if (joke.singleJoke == null && joke.twoPartJoke == null) {
      throw Exception('Joke without a Joke, nonsense');
    }

    return joke;
  }

  @override
  String toString() {
    return 'Joke(category: $category, type: $type, flags: $flags, id: $id, safe: $safe, lang: $lang, singleJoke: $singleJoke, twoPartJoke: $twoPartJoke)';
  }
}

class Flags {
  final bool nsfw;
  final bool religious;
  final bool political;
  final bool racist;
  final bool sexist;
  final bool explicit;

  const Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });
  static Flags fromJson(Map<String, dynamic>? json) {
    return Flags(
      nsfw: json?['nsfw'] ?? true,
      religious: json?['religious'] ?? true,
      political: json?['political'] ?? true,
      racist: json?['racist'] ?? true,
      sexist: json?['sexist'] ?? true,
      explicit: json?['explicit'] ?? true,
    );
  }

  @override
  String toString() {
    return 'Flags(nsfw: $nsfw, religious: $religious, political: $political, racist: $racist, sexist: $sexist, explicit: $explicit)';
  }
}

class SingleJoke {
  final String joke;

  const SingleJoke(this.joke);

  static SingleJoke? tryFromJson(Map<String, dynamic> json) {
    if (json.containsKey('joke')) {
      return SingleJoke(json['joke']);
    }
    return null;
  }

  @override
  String toString() => 'SingleJoke(joke: $joke)';
}

class TwoPartJoke {
  final String setup;
  final String delivery;

  const TwoPartJoke(this.setup, this.delivery);

  static TwoPartJoke? tryFromJson(Map<String, dynamic> json) {
    if (json.containsKey('setup') && json.containsKey('delivery')) {
      return TwoPartJoke(json['setup'], json['delivery']);
    }
    return null;
  }

  @override
  String toString() => 'TwoPartJoke(setup: $setup, delivery: $delivery)';
}
