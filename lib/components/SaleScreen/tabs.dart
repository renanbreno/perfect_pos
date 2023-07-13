import 'package:flutter/material.dart';
import 'package:perfect_pos/components/KeepAlive/keep_alive.dart';
import 'package:perfect_pos/components/SaleScreen/content_cart_tab.dart';
import 'package:perfect_pos/components/SaleScreen/content_catalog_tab.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

class SaleScreenTabs extends StatefulWidget {
  @override
  State<SaleScreenTabs> createState() => _SaleScreenTabs();
}

class _SaleScreenTabs extends State<SaleScreenTabs>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(children: [
      Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: TabBar(
              indicatorColor: UITheme.coraColorBrandDarker,
              unselectedLabelColor: UITheme.coraColorNeutralMedium,
              labelColor: UITheme.coraColorBrandDarker,
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              controller: tabController,
              tabs: const <Widget>[
                Tab(
                  text: "Carrinho",
                ),
                Tab(
                  text: "Catálogo",
                )
              ]),
        )
      ]),
      Expanded(
          child: TabBarView(
        controller: tabController,
        children: const <Widget>[
          KeepPageAlive(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: ContentCartTab(),
          )),
          KeepPageAlive(
            child: Center(
              child: ContentCatalogTab(),
            ),
          )
        ],
      ))
    ]);
  }
}
