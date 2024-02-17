import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/models/model_product.dart';
part 'firebase_riverpod.g.dart';

@Riverpod()
Future<void> addtoCart(
    AddtoCartRef ref, ProductModel products, String currentUser) async {
  final Timestamp timestamp = Timestamp.now();

  await FirebaseFirestore.instance
      .collection("Cart")
      .doc(currentUser)
      .collection('products')
      .add({
    'quantity': products.quantity,
    'id': products.id,
    'title': products.title,
    'price': products.price,
    'category': products.category,
    'description': products.description,
    'images': products.images,
    'timestamp': timestamp,
  });
}

@Riverpod()
Future<void> updateQuanity(UpdateQuanityRef ref, String currentUser,
    String docId, double quantity) async {
  await FirebaseFirestore.instance
      .collection('Cart')
      .doc(currentUser)
      .collection('products')
      .doc(docId)
      .update({
    'quantity': quantity,
  });
}

@Riverpod()
Future<void> deleteCart(
    DeleteCartRef ref, String currentUser, String product) async {
  await FirebaseFirestore.instance
      .collection('Cart')
      .doc(currentUser)
      .collection('products')
      .doc(product)
      .delete();
}

@Riverpod()
Future<List<String>> getIdCart(GetIdCartRef ref, String currentUser) async {
  List<String> ids = [];
  await FirebaseFirestore.instance
      .collection('Cart')
      .doc(currentUser)
      .collection('products')
      .orderBy('timestamp', descending: true)
      .get()
      // ignore: avoid_function_literals_in_foreach_calls
      .then((value) => value.docs.forEach((documents) {
            ids.add(documents.reference.id);
          }));
  return ids;
}
