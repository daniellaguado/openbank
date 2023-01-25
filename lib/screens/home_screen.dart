import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/auth_http.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [
        IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              logout.logout();
              Navigator.pushReplacementNamed(context, 'checkout');
            }),
      ]),
    );
  }
}
