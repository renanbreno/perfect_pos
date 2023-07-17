import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:perfect_pos/components/SaleScreen/tabs.dart';
import 'package:perfect_pos/controllers/auth_controller_cognito.dart';
import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:perfect_pos/views/login.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void handleSignOutResult(SignOutResult result) {
      bool isSignOut = bool.parse(result
          .toJson()
          .entries
          .firstWhere((element) => element.key == "signedOutLocally")
          .value
          .toString());

      if (isSignOut) {
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
    }

    void handleSignOutError(String message) {
      print(message);
    }

    void handleSignOut() {
      AuthControllerCognito.instance.signOutUser(
          onSignOutSucessfuly: handleSignOutResult,
          onSignOutError: handleSignOutError);
    }

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
                      Row(
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 20,
                            children: [
                              const Icon(
                                Icons.search_outlined,
                                size: 28,
                              ),
                              IconButton(
                                  onPressed: () => {handleSignOut()},
                                  icon: const CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        UITheme.coraColorBrandMedium,
                                    child: Center(
                                      child: Text(
                                        "LL",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )),
                              const Icon(
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
