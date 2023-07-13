import 'package:flutter/material.dart';
import 'package:perfect_pos/providers/function_card_provider.dart';

List<FunctionCardProvider> options = [
  FunctionCardProvider(
      name: "Iniciar uma venda",
      icon: Icons.shopping_cart_checkout_outlined,
      screenName: "saleScreen"),
  FunctionCardProvider(
      name: "Histórico de vendas",
      icon: Icons.point_of_sale_outlined,
      screenName: ""),
  FunctionCardProvider(
      name: "Menu Sitef", icon: Icons.credit_card_outlined, screenName: ""),
  FunctionCardProvider(name: "Ajuda", icon: Icons.help_outline, screenName: ""),
  FunctionCardProvider(
      name: "Consultar preço", icon: Icons.search_outlined, screenName: ""),
];
