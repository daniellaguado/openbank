import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:openbank/provider/auth_http.dart';
import 'package:openbank/ui/notifications.dart';
import '../../provider/login_reg_auth.dart';
import '../../ui/input_decorations.dart';

class RegisterForm extends ConsumerWidget {
  RegisterForm({Key? key}) : super(key: key);

  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var dateMask = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statepass = ref.watch(statePassword);
    final registerKey = ref.watch(registerKeyProvider);
    final authService = ref.watch(authServiceProvider);
    return Form(
        key: registerKey.formKey,
        child: Column(
          children: [
            //========================================== COMPLETE NAME FIELD ==============================
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.formImputDecoration(
                  'Nome completo', null, null),
              validator: ((value) {
                String pattern =
                    r'^([A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+[\-]{0,1}[A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+)(\s+([A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+[\-]{0,1}[A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+))*$';

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : '';
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
            //========================================== CPF FIELD =================================
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: 14,
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.phone,
              decoration:
                  InputDecorations.formImputDecoration('C.P.F', null, null),
              validator: ((value) {
                if (value == null || value.length > 13) {
                  return null;
                }
                return '';
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            //
            //
            //
            //
            //========================================== DATE FIELD =================================
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [dateMask],
                keyboardType: TextInputType.phone,
                decoration: InputDecorations.formImputDecoration(
                  'Data de nascimento',
                  'dd/mm/yyyy',
                  null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  final components = value.split("/");
                  if (components.length == 3) {
                    final day = int.tryParse(components[0]);
                    final month = int.tryParse(components[1]);
                    final year = int.tryParse(components[2]);
                    if (day != null && month != null && year != null) {
                      final date = DateTime(year, month, day);
                      if (date.year == year &&
                          date.month == month &&
                          date.day == day) {
                        return null;
                      }
                    }
                  }
                  return '';
                }),
            const SizedBox(
              height: 30,
            ),
            //
            //
            //
            //
            //========================================== EMAIL FIELD ==============================
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
                if (value == null || value.length <= 6) {
                  return '';
                }
                return null;
              }),
            ),
            //
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
                color: Color.fromRGBO(86, 13, 50, 1),
                onPressed: (() async {
                  FocusScope.of(context).unfocus();
                  //
                  final errorMessage =
                      await ref.read(authServiceProvider).createUser(
                            authService.email,
                            authService.password,
                          );

                  if (registerKey.formKey.currentState!.validate() == true &&
                      errorMessage == null) {
                    Navigator.pushReplacementNamed(context, 'checkout');
                    registerKey.isLoading = true;
                  } else {
                    ScaffoldNotification.showSnakbar('$errorMessage');

                    print(errorMessage);
                  }

                  registerKey.formKey.currentState!.validate();
                }),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10),
                    child: Text(
                        registerKey.isLoading ? 'Espere' : 'Cadastrar-se',
                        style: const TextStyle(color: Colors.white))))
          ],
        ));
  }
}
