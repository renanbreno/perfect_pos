import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfect_pos/controllers/auth_controller_cognito.dart';

import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:perfect_pos/views/home.dart';
import 'package:perfect_pos/views/sign_up.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    void clearFields() {
      userNameController.text = "";
      passwordController.text = "";
    }

    handleSignInResult(SignInResult result) {
      if (result.isSignedIn) {
        clearFields();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                Home(userName: userNameController.text),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      }
    }

    handleSignInError(String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    handleSignIn() {
      AuthControllerCognito.instance.signInUser(
          username: userNameController.text,
          password: passwordController.text,
          onSignInResult: handleSignInResult,
          onSignInError: handleSignInError);
    }

    return Scaffold(
      body: Center(
        child: ListView(children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: MediaQuery.of(context).size.width,
            semanticsLabel: "top",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                        controller: userNameController,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: const Text('Não sou cadastrado'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => SignUp(),
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  foregroundColor: Colors.white,
                                  backgroundColor: UITheme.coraColorBrandMedium,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  elevation: 15),
                              child: const Text('Entrar'),
                              onPressed: () {
                                handleSignIn();
                              },
                            ),
                          )
                        ],
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
