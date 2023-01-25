import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbank/screens/screens.dart';
import '../provider/auth_http.dart';

class CheckAuthScreen extends ConsumerWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readToken = ref.watch(authServiceProvider);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: readToken.readToken(),
            builder: (BuildContext context, snapshot) {
              //
              //
              //
              if (!snapshot.hasData) {
                //puede ir un spnin
                return Text('espere');
              }
              //
              //
              //
              if (snapshot.data == '') {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginScreen(),
                          transitionDuration: const Duration(seconds: 0)));
                });
              } else {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomeScreen(),
                          transitionDuration: const Duration(seconds: 0)));
                });
              }
              return Container(
                child: Text('Aqui puede ir el lazy'),
              );
            }),
      ),
    );
  }
}
