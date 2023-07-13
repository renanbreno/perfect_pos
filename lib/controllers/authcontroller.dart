class AuthController {
  static const _user = 'Renan';
  static const _password = '1234';

  bool isValidUser(String user, String pass) =>
      user == _user && pass == _password;

  String get userName => _user;
}
