import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../backend/users.dart';

class UserService extends ChangeNotifier {
  final String _baseUrl = 'openbank-305a2-default-rtdb.firebaseio.com';
  List<dynamic> userInformation = [];
  // bool isLoading = true;

  UserService() {
    getUserList();
  }
//

  Future getUserList() async {
    final url = Uri.https(_baseUrl, 'results.json');
    final resp = await http.get(url);
    final Map<String, dynamic> decodeUser = json.decode(resp.body);
    final usersResponse = UserInformation.fromJson(resp.body);
    // print(decodeUser);
    print(decodeUser);
    // notifyListeners();

    //
    //
    //
    //
    //
    //
    //
    //
    //
    decodeUser.forEach(
      (key, value) {
        final tempUser = UserInformation.fromMap(value);

        tempUser.id = key;
        userInformation.add(tempUser);
      },
    );
    print(usersResponse.user1);
  }
}

//
//
final userServiceProvider = ChangeNotifierProvider<UserService>((ref) {
  return UserService();
});
