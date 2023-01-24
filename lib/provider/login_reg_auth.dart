import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatePassword extends StateNotifier<bool> {
  StatePassword() : super(true);
  void changeState() => state = state == true ? false : !state;
}

final statePassword = StateNotifierProvider<StatePassword, bool>(
  (ref) => StatePassword(),
);

class LoginKey extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}

final loginKeyProvider = ChangeNotifierProvider<LoginKey>((ref) {
  return LoginKey();
});

class RegisterKey extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}

final registerKeyProvider = ChangeNotifierProvider<RegisterKey>((ref) {
  return RegisterKey();
});
