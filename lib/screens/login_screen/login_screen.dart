import 'package:flutter/material.dart';
import 'login_screen_routes.dart';

//
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//-----------------------------------------------------BACKGROUND//
      body: LoginBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
//-----------------------------------------------------ICON DO LOGIN//
            const LoginIconCard(),
//-----------------------------------------------------LOGIN CARD//
            LoginCard(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
//-----------------------------------------------------FORM AND BUTTON lOGIN //
                  LoginForm(),
                ],
              ),
            ),
            // const SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                // shape: MaterialStateProperty.all(StadiumBorder()),

                overlayColor: MaterialStateProperty.all(
                  Colors.red.withOpacity(0.1),
                ),
              ),
              onPressed: (() =>
                  Navigator.pushReplacementNamed(context, 'register')),
              child: const Text(
                'Criar uma nova conta',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
