import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfect_pos/amplifyconfiguration.dart';
import 'package:provider/provider.dart';
import 'package:perfect_pos/controllers/customercontroller.dart';
import 'package:perfect_pos/controllers/salecontroller.dart';
import 'package:perfect_pos/providers/product_provider.dart';
import 'package:perfect_pos/views/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(const SaleSystem());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    safePrint("Amplify configured successfuly");
  } catch (e) {
    safePrint("Error configuring Amplify: $e");
  }
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
        home: const Login(),
      ),
    );
  }
}
