import 'package:flutter/material.dart';

class CustomerController extends ChangeNotifier {
  String _customerName = '';

  setCustomerName(String name) {
    if (_customerName != name) {
      _customerName = name;
      notifyListeners();
    }
  }

  String get customerName => _customerName;
}
