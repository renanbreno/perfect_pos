import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:perfect_pos/views/home.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

import 'package:perfect_pos/controllers/authcontroller.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isValidUser() =>
    AuthController().isValidUser(emailController.text, passwordController.text);

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: MediaQuery.of(context).size.width,
            semanticsLabel: "top",
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PerfectPOS Group",
                  style: TextStyle(
                      color: UITheme.coraColorNeutralMedium,
                      fontWeight: FontWeight.w600,
                      fontSize: 32),
                ),
              ],
            ),
          ),
          Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: 28,
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: UITheme.coraColorNeutralLighter,
                            labelStyle:
                                TextStyle(color: UITheme.coraColorNeutralDark),
                            labelText: "Usuário"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe o usuário";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 28,
                            ),
                            filled: true,
                            border: InputBorder.none,
                            fillColor: UITheme.coraColorNeutralLighter,
                            labelStyle:
                                TextStyle(color: UITheme.coraColorNeutralDark),
                            labelText: "Senha"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe a senha";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              foregroundColor: Colors.white,
                              backgroundColor: UITheme.coraColorBrandMedium,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              elevation: 15),
                          child: const Text('Entrar'),
                          onPressed: () {
                            if (isValidUser()) {
                              emailController.text = "";
                              passwordController.text = "";
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => Home(),
                                  transitionDuration:
                                      const Duration(milliseconds: 400),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Login ou senha incorretos')));
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
