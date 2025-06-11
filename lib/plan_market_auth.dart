import 'package:flutter/material.dart';

/// A Calculator.
class PlanMarketAuth with ChangeNotifier {



  String? _mensagem;
  String? token;

  final _url = "https://identitytoolkit.googleapis.com";
  final _resource = "/v1/accounts";
  final apikey = 'AIzaSyDek1Qb1p8EPhZZZ8GtbGWjic62awCfUNc';

  get mensagemErro {
    return _mensagem;
  }

  void signOut() {
    token = null;
    _mensagem = null;
    notifyListeners();
  }

  void signIn(String email, String senha) {
    // Implement signIn logic here
  }

  // Implement signUp and signIn methods here
}
