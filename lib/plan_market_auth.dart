import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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


  Future<bool> signUp(String email, String pass) async {
    String sUri = '$_url$_resource:signUp?key=$apikey';
    Uri uri = Uri.parse(sUri);
    print(uri);
    print(email);
    print(pass);
    var response = await http.post(uri, body: {
      'email': email,
      'password': pass,
      'returnSecureToken': 'true'
    });

    if (response.statusCode == 200) {
      _mensagem = 'Usuário criado com sucesso';

      var responseData = jsonDecode(response.body);
      token = responseData['idToken'];
      return true;
    }else {
      final responseData = jsonDecode(response.body);
      _mensagem = responseData['error']['message'];
      return false;
    }

  }

  Future<bool> signIn(String email, String senha) async {
    String sUri = '$_url$_resource:signInWithPassword?key=$apikey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(
        uri,
        body: {
          'email': email,
          'password': senha,
          'returnSecureToken': 'true',
        });
    if (response.statusCode == 200) {
      _mensagem = 'Usuário criado com sucesso';
      print('MENSAGEM')
      print(_mensagem);
      final responseData = json.decode(response.body);
      token = responseData['idToken'];
      notifyListeners();
      return true;
    } else {
      final responseData = json.decode(response.body);
      _mensagem = responseData['error']['message'];
      print('MENSAGEM');
      print(_mensagem);
      return false;
    }

  }
}
