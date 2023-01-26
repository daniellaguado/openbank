import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/auth_http.dart';
import '../../provider/user_http.dart';
import 'home_screen_routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(authServiceProvider);
    final user = ref.watch(userServiceProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(86, 13, 50, 1),
          leading: IconButton(
            icon: Icon(Icons.light_mode_rounded),
            onPressed: () {
              print(user.getUserList().toString());
            },
          ),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'InfinityBank',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                logout.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(children: const [
          HomeBasicUserInformation(),
          CarrouselWidget(),
        ]),
      ),
    );
  }
}
