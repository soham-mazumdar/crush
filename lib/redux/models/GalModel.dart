class Gal {
  final String url;
  final String caption;

  Gal({
    this.url,
    this.caption,
  });

  factory Gal.fromJson(Map<String, dynamic> json) {
    return Gal(
      url: json['url'],
      caption: json['caption'],
    );
  }

   Map<String, dynamic> toJson() => {
		"url": url,
		"caption": caption,
	};
}