import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class ProductTile extends StatelessWidget {
  final int index;

  ProductTile({Key? key, required this.index}) : super(key: key);
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    double productPrice = context.watch<SaleController>().productPrice(index);
    String productName = context.watch<SaleController>().productName(index);
    String productImage = context.watch<SaleController>().productImage(index);
    String productID = context.watch<SaleController>().productID(index);
    int productQuantity =
        context.watch<SaleController>().quantityByIndex(index);

    return Card(
        color: UITheme.coraColorBrandLightest,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    productImage,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productID,
                            style: const TextStyle(
                                color: UITheme.coraColorNeutralDark,
                                fontSize: 16),
                          ),
                          Text(
                            productName,
                            style: const TextStyle(
                                color: UITheme.coraColorNeutralDarker,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Text(
                        '${formatCurrency.format(productPrice)} / un',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<SaleController>()
                                  .decreaseQuantity(index);
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 22,
                        child: Text(
                          productQuantity.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: IconButton(
                            onPressed: () {
                              context
                                  .read<SaleController>()
                                  .increaseQuantity(index);
                            },
                            icon: const Icon(Icons.add)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<SaleController>().removeProduct(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: UITheme.semanticDangerMedium,
                          )),
                      Text(
                        formatCurrency.format(productPrice * productQuantity),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
