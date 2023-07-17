import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_pos/controllers/auth_controller_cognito.dart';
import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:perfect_pos/views/login.dart';
import 'package:perfect_pos/views/sign_up_confirmation.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    handleSignUpResult(SignUpResult result) {
      if (result.nextStep.signUpStep == AuthSignUpStep.confirmSignUp) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => SignUpConfirmation(
                userName: userNameController.text, email: emailController.text),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      }
    }

    handleSignUpError(String message, bool redirectToLogin) {
      if (redirectToLogin) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => Login(),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    void handleSignUp() {
      AuthControllerCognito.instance.signUp(
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        onSignUpResultSuccessfuly: (SignUpResult result) =>
            handleSignUpResult(result),
        onSignUpResultError: (String message, bool redirectToLogin) =>
            handleSignUpError(message, redirectToLogin),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 40, 21, 21),
        foregroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
        elevation: 0,
      ),
      body: Center(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Cadastre-se",
              style: TextStyle(
                  color: UITheme.coraColorNeutralMedium,
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
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
                              labelStyle: TextStyle(
                                  color: UITheme.coraColorNeutralDark),
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
                          controller: emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 28,
                              ),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: UITheme.coraColorNeutralLighter,
                              labelStyle: TextStyle(
                                  color: UITheme.coraColorNeutralDark),
                              labelText: "Email"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Informe o email";
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
                              labelStyle: TextStyle(
                                  color: UITheme.coraColorNeutralDark),
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
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        UITheme.coraColorBrandMedium,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    elevation: 15),
                                child: const Text('Cadastrar'),
                                onPressed: () {
                                  handleSignUp();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
