

class Service {
  final String title;
  final String desc;
  final String intro;
  final String time;
  final String price;
  final String images;

  Service({
    this.title,
    this.desc,
    this.intro,
    this.time,
    this.price,
    this.images
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      title:  json['title'],
      desc:   json['desc'],
      intro:  json['intro'],
      time:   json['time'],
      price:  json['price'],
      images: json['images'][0],
    );
  }

   Map<String, dynamic> toJson() => {
		"title": title,
    "desc": desc,
    "intro": intro,
    "time": time,
    "price": price,
    "images": images,
	};
}