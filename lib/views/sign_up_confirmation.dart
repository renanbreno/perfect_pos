import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:perfect_pos/controllers/auth_controller_cognito.dart';
import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:perfect_pos/views/home.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController confirmationCodeController = TextEditingController();

class SignUpConfirmation extends StatelessWidget {
  String userName;
  String email;

  SignUpConfirmation({Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleSignUpResult(SignUpResult result) {
      if (result.nextStep.signUpStep == AuthSignUpStep.done) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => Home(
              userName: userName,
            ),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      }
    }

    handleConfirmationSignUp() {
      AuthControllerCognito.instance.confirmUser(
          username: userName,
          confirmationCode: confirmationCodeController.text,
          onConfirmationResult: (SignUpResult result) =>
              handleSignUpResult(result));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Um código de confirmação foi enviado para $email.",
                style: const TextStyle(
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
                        TextFormField(
                          controller: confirmationCodeController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.code,
                                size: 28,
                              ),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: UITheme.coraColorNeutralLighter,
                              labelStyle: TextStyle(
                                  color: UITheme.coraColorNeutralDark),
                              labelText: "Código de confirmação"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Informe o código de confirmação";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SizedBox(
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
                              child: const Text('Validar código'),
                              onPressed: () {
                                handleConfirmationSignUp();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
