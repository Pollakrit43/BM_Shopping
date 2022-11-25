import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom/models/product_model.dart';
import 'package:flutter_ecom/repository/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.formSnapshot(doc)).toList();
    });
  }
}
