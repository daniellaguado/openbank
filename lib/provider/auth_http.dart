import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseBaseToken = 'AIzaSyBR_2RHJC5D6foAYHUmjAlGLKOnkdi-erw';
  //
  final storage = const FlutterSecureStorage();
  String password = '';
  // String get getpassword => password;

  // set setpassword(String value) {
  //   password = value;
  //   notifyListeners();
  //   print(password);
  // }

  String email = '';
  // String get getEmail => email;

  // set setEmail(String value) {
  //   email = value;
  //   notifyListeners();
  //   print(email);
  // }
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authenticationData = {
      'email': email,
      'password': password,
    };

//-------------------- Ceation URL --------------------------------//
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseBaseToken});

//--------------------Convert 'authenticationData' to JSON --------------------------------
    final resp = await http.post(url, body: json.encode(authenticationData));

//--------------------Convert back 'authenticationData' to Map ----------------------------
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  //
  //
  //
  //
  ///
  //-----------------Login Auth ----------------//
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authenticationData = {
      'email': email,
      'password': password,
    };

//-------------------- Ceation URL --------------------------------//
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',
        {'key': _firebaseBaseToken});

//--------------------Convert 'authenticationData' to JSON --------------------------------
    final resp = await http.post(url, body: json.encode(authenticationData));

//--------------------Convert back 'authenticationData' to Map ----------------------------
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}

//
//
final authServiceProvider = ChangeNotifierProvider<AuthService>((ref) {
  return AuthService();
});
