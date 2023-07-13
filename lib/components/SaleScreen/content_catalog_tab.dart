import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/components/ProductCatalog/product_catalog.dart';
import 'package:perfect_pos/providers/product_provider.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class ContentCatalogTab extends StatefulWidget {
  const ContentCatalogTab({Key? key}) : super(key: key);

  @override
  State<ContentCatalogTab> createState() => _ContentCatalogTab();
}

class _ContentCatalogTab extends State<ContentCatalogTab> {
  // final ProductsController productsController = ProductsController();
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 28,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: UITheme.coraColorNeutralLighter,
              labelStyle: TextStyle(color: UITheme.coraColorNeutralDark),
              labelText: "Consultar produto"),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: products.count,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: itemWidth / itemHeight,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return ProductCatalog(
                  index: index,
                  productID: products.byIndex(index).productID,
                  productPrice: products.byIndex(index).productPrice,
                  productName: products.byIndex(index).productName,
                  productImage: products.byIndex(index).productImage,
                );
              },
              shrinkWrap: true,
            ),
          ),
        )
      ],
    );
  }
}
