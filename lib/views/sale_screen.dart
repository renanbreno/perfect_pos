import 'package:flutter/material.dart';
import 'package:perfect_pos/components/SaleScreen/tabs.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class SaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.chevron_left,
                              size: 32,
                            )),
                        const Text(
                          "Vender",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ]),
                      const Row(
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 20,
                            children: [
                              Icon(
                                Icons.search_outlined,
                                size: 28,
                              ),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: UITheme.coraColorBrandMedium,
                                child: Center(
                                  child: Text(
                                    "LL",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 28,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: SaleScreenTabs()),
          ],
        ),
      ),
    );
  }
}
