import 'package:flutter/material.dart';

class LoginIconCard extends StatelessWidget {
  const LoginIconCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: Icon(
          Icons.all_inclusive_sharp,
          color: Color.fromRGBO(86, 13, 50, 1),
          size: 100,
        ));
  }
}
