import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/components/CustomerBar/customer_bar.dart';
import 'package:perfect_pos/components/ProductList/product_list.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class ContentCartTab extends StatefulWidget {
  const ContentCartTab({super.key});

  @override
  State<ContentCartTab> createState() => _ContentCartCardState();
}

class _ContentCartCardState extends State<ContentCartTab> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerBar(),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 32, bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 4,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            color: UITheme.coraColorNeutralDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formatCurrency.format(
                            context.watch<SaleController>().totalValue()),
                        style: const TextStyle(
                            fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                      Visibility(
                          visible: false,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              const Icon(Icons.attach_money),
                              Text(
                                'Sua economia foi de ${formatCurrency.format(0)}',
                                style: const TextStyle(
                                    color: UITheme.semanticSuccessDarker,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
                width: 80,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: UITheme.coraColorBrandMedium,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      elevation: 15),
                  child: const Icon(
                    Icons.check,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
        ProductList(),
      ],
    );
  }
}
