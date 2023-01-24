import 'package:flutter/material.dart';

class LoginIconCard extends StatelessWidget {
  const LoginIconCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: Icon(
          Icons.all_inclusive_sharp,
          color: Colors.white,
          size: 100,
        ));
  }
}
