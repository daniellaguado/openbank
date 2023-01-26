import 'package:flutter/material.dart';

class UserCardBackground extends StatelessWidget {
  const UserCardBackground({Key? key, required this.child}) : super(key: key);
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
