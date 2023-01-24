import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../provider/auth_http.dart';
import '../../provider/login_reg_auth.dart';
import '../../ui/input_decorations.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({Key? key}) : super(key: key);
  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statepass = ref.watch(statePassword);
    final loginKey = ref.watch(loginKeyProvider);
    final authService = ref.watch(authServiceProvider);

    return Form(
        key: loginKey.formKey,
        child: Column(
          children: [
            //========================================== CPF FIELD =================================
            // TextFormField(
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   maxLength: 14,
            //   inputFormatters: [maskFormatter],
            //   keyboardType: TextInputType.phone,
            //   decoration:
            //       InputDecorations.formImputDecoration('C.P.F', null, null),
            //   validator: ((value) {
            //     if (value == null || value.length > 13) {
            //       return null;
            //     }
            //     return '';
            //   }),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            //
            //
            //
            //
            TextFormField(
              onChanged: (value) => authService.email = value,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              keyboardType: TextInputType.emailAddress,
              // maxLength: 10,
              // autocorrect: false,
              // obscureText: statepass,
              decoration:
                  InputDecorations.formImputDecoration('E-mail', null, null),
              validator: ((value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : '';
              }),
            ),
            //========================================== PASSWORD FIELD ==============================
            TextFormField(
              onChanged: (value) => authService.password = value,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: 7,
              autocorrect: false,
              obscureText: statepass,
              decoration: InputDecorations.formImputDecoration(
                'Senha',
                null,
                IconButton(
                  onPressed: () {
                    ref.read(statePassword.notifier).changeState();
                  },
                  icon: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      const iconOpenEyes = Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black54,
                      );
                      const iconCloseEyes = Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                      );
                      final statepass = ref.watch(statePassword);
                      final iconChange = statepass == true
                          ? iconOpenEyes
                          : FadeIn(
                              duration: const Duration(seconds: 1),
                              child: iconCloseEyes);
                      return iconChange;
                    },
                  ),
                ),
              ),
              validator: ((value) {
                if (value == null || value.length <= 9) {
                  return '';
                }
                return null;
              }),
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 30,
            ),
            //
            //
            //
            //
            //-------------- BUTTON LOGIN -----------------------------------//
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepOrange,
                onPressed: (() async {
                  //
                  final errorMessage =
                      await ref.read(authServiceProvider).login(
                            authService.email,
                            authService.password,
                          );

                  if (errorMessage == null) {
                    Navigator.pushReplacementNamed(context, 'home');
                    loginKey.isLoading = true;
                  } else {
                    //TODO: Mostrar mensaje de error en pantalla
                    print(errorMessage);
                  }

                  // if (registerKey.formKey.currentState!.validate()) {
                  // }
                }),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10),
                    child: Text(loginKey.isLoading ? 'Espere' : 'Ingresar',
                        style: const TextStyle(color: Colors.white))))
          ],
        ));
  }
}
