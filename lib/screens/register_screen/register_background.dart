import 'package:flutter/material.dart';

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({Key? key, required this.child}) : super(key: key);
  //
  final Widget child;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 251, 249, 252),
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        child,
      ]),
    );
  }
}
