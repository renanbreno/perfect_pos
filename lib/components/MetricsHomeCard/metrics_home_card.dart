import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  bool visibleValues;

  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

  HomeCard(this.visibleValues, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Container(
          transform: Matrix4.translationValues(0.0, -70, 0.0),
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 20,
                )
              ]),
          child: GridView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    visibleValues ? formatCurrency.format(0.00) : "--",
                    style: const TextStyle(
                        color: UITheme.coraColorBrandMedium,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Realizado",
                    style: TextStyle(
                        color: UITheme.coraColorNeutralDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("--",
                      style: TextStyle(
                          color: UITheme.coraColorNeutralDark,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  Text("Atingido",
                      style: TextStyle(
                          color: UITheme.coraColorNeutralDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("--",
                      style: TextStyle(
                          color: UITheme.coraColorNeutralDark,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  Text("Meta",
                      style: TextStyle(
                          color: UITheme.coraColorNeutralDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w600))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
