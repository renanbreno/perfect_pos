import 'package:flutter/material.dart';
import 'package:perfect_pos/controllers/system_status_controller.dart';
import 'package:perfect_pos/providers/product_provider.dart';
import 'package:perfect_pos/models/sale_list_items.dart';

class SaleController extends ChangeNotifier {
  ProductProvider productProvider = ProductProvider();

  final List<SaleListModel> _products = [];

  addProduct(String productID) {
    if (!SystemStatusController.instance.status().contains("venda_aberta")) {
      SystemStatusController.instance.add("venda_aberta");
    }

    _products.add(SaleListModel(
        productID: productID,
        productImage: "assets/product.png",
        productName: productProvider.byProductID(productID).productName,
        productPrice: productProvider.byProductID(productID).productPrice,
        productQuantity: 1));

    notifyListeners();
  }

  removeProduct(int index) {
    _products.removeAt(index);

    bool existsItemsOnSale = checkIfExistsItemsOnSale();

    if (!existsItemsOnSale) {
      finishSale();
    }

    notifyListeners();
  }

  finishSale() {
    SystemStatusController.instance.add("venda_fechada");
  }

  increaseQuantity(int index) {
    int currentQuantity = _products.elementAt(index).productQuantity;

    _products.elementAt(index).productQuantity = currentQuantity + 1;

    notifyListeners();
  }

  decreaseQuantity(int index) {
    int currentQuantity = _products.elementAt(index).productQuantity;

    if (currentQuantity == 1) {
      removeProduct(index);
      return;
    }

    _products.elementAt(index).productQuantity = currentQuantity - 1;
    notifyListeners();
  }

  bool checkIfExistsItemsOnSale() {
    return _products.isNotEmpty;
  }

  addDiscount() {}

  double totalValue() {
    if (_products.isEmpty) return 0;

    double totalValue = _products
        .map((e) => e.productPrice * e.productQuantity)
        .reduce((value, element) => value + element);
    return totalValue;
  }

  int quantityByIndex(int index) => _products.elementAt(index).productQuantity;
  int get countProducts => _products.length;
  String productID(int index) => _products.elementAt(index).productID;
  String productName(int index) => _products.elementAt(index).productName;
  double productPrice(int index) => _products.elementAt(index).productPrice;
  String productImage(int index) => _products.elementAt(index).productImage;

  bool productExists(String productID) {
    var element = _products.firstWhere(
        (element) => element.productID == productID,
        orElse: () => SaleListModel(
            productID: "",
            productQuantity: 0,
            productName: "",
            productImage: "",
            productPrice: 0));

    return element.productID.isNotEmpty;
  }

  List<String> status = SystemStatusController.instance.status();
}
