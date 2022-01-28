class JokeFlags {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  JokeFlags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  JokeFlags.fromJson(Map<String, dynamic> json) {
    nsfw = json['nsfw'];
    religious = json['religious'];
    political = json['political'];
    racist = json['racist'];
    sexist = json['sexist'];
    explicit = json['explicit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nsfw'] = nsfw;
    data['religious'] = religious;
    data['political'] = political;
    data['racist'] = racist;
    data['sexist'] = sexist;
    data['explicit'] = explicit;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JokeFlags &&
        other.nsfw == nsfw &&
        other.religious == religious &&
        other.political == political &&
        other.racist == racist &&
        other.sexist == sexist &&
        other.explicit == explicit;
  }

  @override
  int get hashCode {
    return nsfw.hashCode ^
        religious.hashCode ^
        political.hashCode ^
        racist.hashCode ^
        sexist.hashCode ^
        explicit.hashCode;
  }
}
