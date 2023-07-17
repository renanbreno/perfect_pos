import 'package:amplify_core/amplify_core.dart';

class AuthControllerCognito {
  AuthControllerCognito._privateConstructor();

  static final AuthControllerCognito instance =
      AuthControllerCognito._privateConstructor();

  void signUp(
      {required String userName,
      required String email,
      required String password,
      required Function(SignUpResult result) onSignUpResultSuccessfuly,
      required Function(String message, bool redirectToLogin)
          onSignUpResultError}) {
    Map<AuthUserAttributeKey, String> userAttributes = {
      AuthUserAttributeKey.email: email
    };

    Amplify.Auth.signUp(
            username: userName,
            password: password,
            options: SignUpOptions(userAttributes: userAttributes))
        .then((SignUpResult result) => onSignUpResultSuccessfuly(result))
        .catchError((err) => {
              if (err.message == "User already exists")
                {onSignUpResultError("Usuário já existe", true)}
              else
                {onSignUpResultError(err.message, false)}
            });
  }

  void handleCodeDeliveryStatus(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  void confirmUser(
      {required String username,
      required String confirmationCode,
      required Function(SignUpResult result) onConfirmationResult}) {
    Amplify.Auth.confirmSignUp(
      username: username,
      confirmationCode: confirmationCode,
    ).then((SignUpResult result) => onConfirmationResult(result));
  }

  void signInUser(
      {required String username,
      required String password,
      required Function(SignInResult result) onSignInResult,
      required Function(String message) onSignInError}) {
    Amplify.Auth.signIn(
      username: username,
      password: password,
    )
        .then((SignInResult result) => onSignInResult(result))
        .catchError((err) => {
              if (err.message == "Incorrect username or password.")
                {onSignInError("Usuário ou senha inválidos")}
              else
                onSignInError(err.message)
            });
  }

  void signOutUser(
      {required Function(SignOutResult result) onSignOutSucessfuly,
      required Function(String message) onSignOutError}) {
    Amplify.Auth.signOut()
        .then((SignOutResult result) => onSignOutSucessfuly(result))
        .catchError((error) => onSignOutError(error));
  }
}
