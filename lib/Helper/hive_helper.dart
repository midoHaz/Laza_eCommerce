import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laza_commerce/Helper/hive_database.dart';

class Review {
  final String name;
  final String description;
  final double starRating;

  Review({
    required this.name,
    required this.description,
    required this.starRating,
  });
}

class HiveHelper {
  static const String reviewsBoxKey = 'reviewsBox';
  List<Review> reviewsData = [];

  void addReview(String name, String desc, double star) {
    final review = Review(name: name, description: desc, starRating: star);
    reviewsData.add(review);
    Hive.box(reviews).put(reviews, reviewsData);
    print("====================================${reviewsData[0].starRating}");
  }

  Future<void> getReviewsFromHive() async {
    await Hive.box(reviews).get(reviews);
    print('=============================================Reviews data: $reviewsData');
    }
  List<String> getReviewNames() {
    return reviewsData.map((review) => review.name).toList();
  }

  List<String> getReviewDescriptions() {
    return reviewsData.map((review) => review.description).toList();
  }

  List<double> getReviewStarRatings() {
    return reviewsData.map((review) => review.starRating).toList();
  }
  }


