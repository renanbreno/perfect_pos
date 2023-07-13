import 'package:flutter/material.dart';
import 'package:perfect_pos/mocks/products_data.dart';
import 'package:perfect_pos/models/products_model.dart';

class ProductProvider extends ChangeNotifier {
  final Map<String, ProductsModel> _products = {...DUMMY_PRODUCTS};

  List<ProductsModel> get all => [..._products.values];
  int get count => _products.length;
  ProductsModel byIndex(int index) => _products.values.elementAt(index);
  ProductsModel byProductID(String productID) =>
      _products.values.firstWhere((element) => element.productID == productID);
}
