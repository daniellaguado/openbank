import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
