import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class ProductCatalog extends StatelessWidget {
  final int index;
  final String productID;
  final String productImage;
  final String productName;
  final double productPrice;

  ProductCatalog({
    Key? key,
    required this.index,
    required this.productID,
    required this.productPrice,
    required this.productName,
    required this.productImage,
  }) : super(key: key);

  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);
  @override
  Widget build(BuildContext context) {
    bool productExists =
        context.watch<SaleController>().productExists(productID);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UITheme.coraColorNeutralLight),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              productImage,
              height: 100,
            ),
            SizedBox(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                productName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            )),
            Text(
              '${formatCurrency.format(productPrice)} / un',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      foregroundColor: Colors.white,
                      backgroundColor: UITheme.coraColorBrandMedium,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      elevation: 15),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(Icons.shopping_cart),
                      Text(productExists ? "Adicionado" : "Adicionar")
                    ],
                  ),
                  onPressed: () {
                    if (productExists) return;
                    context.read<SaleController>().addProduct(productID);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
