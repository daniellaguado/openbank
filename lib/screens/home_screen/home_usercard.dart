import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbank/screens/home_screen/home_screen_routes.dart';
import '../../provider/auth_http.dart';

class HomeUserCard extends ConsumerWidget {
  const HomeUserCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(authServiceProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(86, 13, 50, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              logout.logout();
              Navigator.pushNamed(context, 'home');
            },
          ),
          elevation: 0,
        ),
        body: UserCardBackground(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
//-----------------------------------------------------ICON DO LOGIN//
//-----------------------------------------------------LOGIN CARD//
            UserInfoColorCard(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Configurações da conta',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
//-----------------------------------------------------FORM AND BUTTON lOGIN //
                  UserForm(),
                ],
              ),
            ),
            // const SizedBox(height: 10),
          ],
        ))));
  }
}
