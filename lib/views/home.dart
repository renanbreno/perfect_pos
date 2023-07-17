import 'package:flutter/material.dart';
import 'package:perfect_pos/components/HomeHeader/home_header.dart';
import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:perfect_pos/components/FunctionCards/FunctionCards.dart';
import 'package:perfect_pos/components/FunctionCards/FunctionCardsOptions.dart';
import 'package:perfect_pos/views/sale_screen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  var functionOptions = options;
  final String userName;

  Home({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: UITheme.coraColorBrandDark,
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              HomeHeader(),
              Container(
                transform: Matrix4.translationValues(0.0, -20, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "O que você gostaria de fazer?",
                      style: TextStyle(
                          fontSize: 20, color: UITheme.coraColorNeutralDark),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  ...options.map((e) => GestureDetector(
                        child: FunctionCards(e.name, e.icon),
                        onTap: () => {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => SaleScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          )
                        },
                      ))
                ],
              ))
            ],
          )),
    );
  }
}
