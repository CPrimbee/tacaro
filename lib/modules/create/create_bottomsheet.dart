import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tacaro/modules/create/create_controller.dart';
import 'package:tacaro/modules/create/repositories/create_repository_impl.dart';
import 'package:tacaro/shared/services/app_database.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';

class CreateBottomsheet extends StatefulWidget {
  const CreateBottomsheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomsheet> createState() => _CreateBottomsheetState();
}

class _CreateBottomsheetState extends State<CreateBottomsheet> {
  late final CreateController controller;

  @override
  void initState() {
    controller = CreateController(
        repository: CreateRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          success: (_) {
            Navigator.pop(context);
          },
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
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              InputText(
                label: "Produto",
                hint: "Digite um nome",
                onChanged: (value) => controller.onChange(name: value),
                validator: (value) =>
                    value.isNotEmpty ? null : "Favor digitar um nome",
              ),
              const SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço",
                hint: "Digite o valor",
                onChanged: (value) => controller.onChange(price: value),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value.isNotEmpty ? null : "Favor digitar um valor",
                inputFormatters: [
                  MoneyInputFormatter(
                    leadingSymbol: "R\$ ",
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              InputText(
                label: "Data da compra",
                hint: "Digite dd/mm/aaaa",
                onChanged: (value) => controller.onChange(date: value),
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                    value.isNotEmpty ? null : "Favor digitar uma data",
                inputFormatters: [
                  MaskedInputFormatter('00/00/0000'),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (message, _) => Text(message),
                      orElse: () => Button(
                          label: "Adicionar",
                          onTap: () {
                            controller.create();
                          })))
            ],
          ),
        ));
  }
}
