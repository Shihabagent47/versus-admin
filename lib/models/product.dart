import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? title;
  final int? amount;
  final List<String>? highlights;
  final String? category;
  final List<String>? details;
  final List<String>? images;
  final String? videoUrl;
  final Timestamp? created;
  final int? ratedpeople;
  final int? totalrating;

  Product({
    this.title,
    this.amount,
    this.highlights,
    this.category,
    this.details,
    this.images,
    this.videoUrl,
    this.created,
    this.ratedpeople,
    this.totalrating
  });

  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Product(
      title: data?['title'],
      amount: data?['amount'],
      highlights: data?['highlights'] is Iterable ? List.from(data?['highlights']) : null,
      category: data?['category'],
      videoUrl: data?['videoUrl'],
      created: data?['created'],
      ratedpeople: data?['ratedpeople'],
      totalrating: data?['totalrating'],
      details: data?['details'] is Iterable ? List.from(data?['details']) : null,
      images: data?['images'] is Iterable ? List.from(data?['images']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (amount != null) "amount": amount,
      if (highlights != null) "highlights": highlights,
      if (category != null) "category": category,
      if (details != null) "details": details,
      if (images != null) "images": images,
      if (videoUrl != null) "videoUrl": videoUrl,
      if (created != null) "created": created,
      if (ratedpeople != null) "ratedpeople": ratedpeople,
      if (totalrating != null) "totalrating": totalrating,
    };
  }
}