
import 'dart:developer';
import 'package:crush/redux/models/GalModel.dart';
import 'package:crush/redux/models/Service.dart';

class Info {
  final String phone;
  final String email;
  final String openingHours;
  final String address;
  final List map;
  final String intro;
  final String bio;
  final List<Service> services;
  final List<Gal> gal;

  Info({
    this.phone,
    this.email,
    this.openingHours,
    this.address,
    this.map,
    this.intro,
    this.bio,
    this.services,
    this.gal
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    List<Service> _services = [];
    for (var service in json["service"]) {
      _services.add(Service.fromJson(service));
    }
    
    List<Gal> _gal = [];
    for (var gallery in json["gallery"]) {
      _gal.add(Gal.fromJson(gallery));
    }
    

    return Info(
      phone         : json['phone'],
      email         : json['email'],
      openingHours  : json['opening_hours'],
      address       : json['address'],
      map           : json["map"],
      intro         : json["intro"],
      bio           : json["bio"],
      services      : _services,
      gal           : _gal,
    );
  }

  //  Map<String, dynamic> toJson() => {
	// 	"id": id,
	// 	"title": title,
	// 	"content": content,
  //   "authorName": authorName,
  //   "authorID": authorID,
  //   "likes": likes
	// };
}