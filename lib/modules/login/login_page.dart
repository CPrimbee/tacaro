import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaro/shared/services/app_database.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = LoginController(
        repository: LoginRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pushNamed(context, "/home", arguments: value),
          error: (message, _) => scaffoldKey.currentState!
              .showBottomSheet((context) => BottomSheet(
                    onClosing: () {},
                    builder: (context) => Text(message),
                  )),
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", width: 200),
              InputText(
                label: "E-mail",
                hint: "Digite seu email",
                onChanged: (value) => controller.onChange(email: value),
                validator: (value) =>
                    isEmail(value) ? null : "Digite um e-mail válido",
              ),
              const SizedBox(
                height: 18,
              ),
              InputText(
                label: "Senha",
                hint: "Digite sua senha",
                obscure: true,
                onChanged: (value) => controller.onChange(password: value),
                validator: (value) =>
                    value.length >= 6 ? null : "Digite uma senha mais forte",
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                        loading: () => const CircularProgressIndicator(),
                        orElse: () => Column(
                          children: [
                            Button(
                                label: "Entrar",
                                onTap: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 50,
                            ),
                            Button(
                                label: "Criar conta",
                                type: ButtonType.outline,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/login/create-account");
                                })
                          ],
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
