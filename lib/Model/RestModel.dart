// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RestModel welcomeFromJson(String str) => RestModel.fromJson(json.decode(str));

String welcomeToJson(RestModel data) => json.encode(data.toJson());

class RestModel {
  RestModel({
    required this.name,
    required this.cuisine,
    required this.reviews,
  });

  String name;
  String cuisine;
  List<Review> reviews;

  factory RestModel.fromJson(Map<String, dynamic> json) => RestModel(
    name: json["name"],
    cuisine: json["cuisine"],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cuisine": cuisine,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    required this.score,
    required this.review,
  });

  String score;
  String review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    score: json["score"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "review": review,
  };
}
