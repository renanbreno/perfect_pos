import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/components/CustomerInput/customer_input.dart';
import 'package:perfect_pos/controllers/customercontroller.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class CustomerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => customerInput(context, (String customerName) {
        context.read<CustomerController>().setCustomerName(customerName);
      }),
      child: Container(
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(10, -5))
        ], color: UITheme.coraColorBrandLightest),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                const Icon(Icons.person),
                Text(
                  context.watch<CustomerController>().customerName == ""
                      ? "Toque para informar um cliente"
                      : context.watch<CustomerController>().customerName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: UITheme.coraColorBrandDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Icon(Icons.edit)
          ]),
        ),
      ),
    );
  }
}
