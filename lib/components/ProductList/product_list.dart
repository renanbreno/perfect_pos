import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/components/ProductTile/product_tile.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: context.watch<SaleController>().countProducts,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ProductTile(index: index),
            ),
          );
        },
      ),
    );
  }
}
