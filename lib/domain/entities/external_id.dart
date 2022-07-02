class ExternalId {
  ExternalId({
    required this.id,
    required this.imdb,
  });

  String id;
  String imdb;

  factory ExternalId.fromJson(Map<String, dynamic> json) => ExternalId(
    id: json["_id"] == null ? "null" : json["_id"],
    imdb: json["imdb"] == null ? "null" : json["imdb"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "imdb": imdb == null ? null : imdb,
  };
}