import 'package:flutter/material.dart';
import 'package:tacaro/shared/button/button.dart';

import 'package:tacaro/shared/input_text/input_text.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 200),
            const InputText(label: "E-mail", hint: "Digite seu email"),
            const SizedBox(
              height: 18,
            ),
            const InputText(label: "Senha", hint: "Digite sua senha"),
            const SizedBox(
              height: 14,
            ),
            const Button(
              label: "Entrar",
            ),
            const SizedBox(
              height: 50,
            ),
            const Button(
              label: "Criar conta",
              type: ButtonType.outline,
            )
          ],
        ),
      ),
    );
  }
}
