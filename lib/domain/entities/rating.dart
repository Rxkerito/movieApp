class Rating {
  Rating({
    required this.id,
    required this.kp,
    required this.imdb,
  });

  String id;
  double kp;
  double imdb;

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(
        id: json["_id"],
        kp: json["kp"].toDouble(),
        imdb: json["imdb"].toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "kp": kp,
        "imdb": imdb,
      };
}