import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key, required this.child}) : super(key: key);
  //
  final Widget child;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[400],
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        child,
      ]),
    );
  }
}
