import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductModelFetch {
  final double? quantity ;
  final int id;
  final String title;
  final double price;
  final Map<String, dynamic> category;
  final String description;
  final List<dynamic> images;
  final Timestamp timestamp;

  ProductModelFetch({
    this.quantity = 1,
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.images,
    required this.timestamp,
  });

  factory ProductModelFetch.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ProductModelFetch(
        quantity: doc['quantity'],
        id: doc['id'],
        title: doc['title'],
        price: doc['price'],
        category: doc['category'],
        description: doc['description'],
        images: doc['images'],
        timestamp: doc['timestamp']);
  }
}
