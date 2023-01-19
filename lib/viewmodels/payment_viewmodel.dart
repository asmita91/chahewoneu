import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel with ChangeNotifier {
  ProductRepository _productRepository = ProductRepository();
  Stream<QuerySnapshot<ProductModel>>? _products;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<ProductModel>>? get products => _products;

  Future<void> getProducts() async {
    var response = _productRepository.getData();
    _products = response;
    notifyListeners();
  }

  Future<void> deleteProducts(String id) async {
    await _productRepository.deleteProduct(id);
    notifyListeners();
  }
}
