import 'package:flutter/material.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';

class CreateBottomsheet extends StatelessWidget {
  const CreateBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const InputText(label: "Produto", hint: "Digite um nome"),
            const SizedBox(
              height: 8,
            ),
            const InputText(label: "Preço", hint: "Digite o valor"),
            const SizedBox(
              height: 8,
            ),
            const InputText(label: "Data da compra", hint: "Digite dd/mm/aaaa"),
            const SizedBox(
              height: 28,
            ),
            Button(label: "Adicionar", onTap: () {})
          ],
        ));
  }
}
