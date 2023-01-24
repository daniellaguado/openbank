import 'package:flutter/material.dart';
import 'register_screen_routes.dart';

//
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//-----------------------------------------------------BACKGROUND//
      body: RegisterBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
//-----------------------------------------------------ICON DO REGISTRO/
            // const RegisterIconCard(),
//-----------------------------------------------------REGISTER CARD//
            RegisterCard(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Criar nova conta',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
//-----------------------------------------------------FORM AND BUTTON REGISTER //
                  RegisterForm(),
                ],
              ),
            ),
            // const SizedBox(height: 50),

            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.red.withOpacity(0.1),
                ),
              ),
              onPressed: (() =>
                  Navigator.pushReplacementNamed(context, 'login')),
              child: const Text(
                'Já tenho uma conta',
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
