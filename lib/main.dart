import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/controllers/customercontroller.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';
import 'package:perfect_pos/providers/product_provider.dart';
import 'package:perfect_pos/views/login.dart';

void main() {
  runApp(const SaleSystem());
}

class SaleSystem extends StatelessWidget {
  const SaleSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomerController()),
        ChangeNotifierProvider(create: (_) => SaleController()),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: MaterialApp(
        title: 'Perfect POS',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // useMaterial3: true,
        ),
        home: Login(),
      ),
    );
  }
}
