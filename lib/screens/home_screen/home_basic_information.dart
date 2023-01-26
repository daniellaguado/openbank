import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbank/provider/user_http.dart';

class HomeBasicUserInformation extends ConsumerWidget {
  const HomeBasicUserInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      color: Colors.yellow,
      child: Row(
        children: const [
          UserImage(),
          UserName(),
          IconManageAccount(),
        ],
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.png'),
            image: AssetImage(
              'assets/no-image.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class UserName extends ConsumerWidget {
  const UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userServiceProvider);

    return Expanded(
        child: Text(
      'alternaitov',
      textAlign: TextAlign.center,
    ));
  }
}

class IconManageAccount extends StatelessWidget {
  const IconManageAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              'usercard',
            );
          },
          icon: const Icon(
            Icons.manage_accounts,
            size: 30,
          )),
    );
  }
}
