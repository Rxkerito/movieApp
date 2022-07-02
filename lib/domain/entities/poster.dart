class Poster {
  Poster({
    required this.id,
    required this.url,
    required this.previewUrl,
  });

  String id;
  String url;
  String previewUrl;

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    id: json["_id"] == null ? "null" : json["_id"],
    url: json["url"] == null ? "null" : json["url"],
    previewUrl: json["previewUrl"] == null ? "null" : json["previewUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
    "previewUrl": previewUrl,
  };
}