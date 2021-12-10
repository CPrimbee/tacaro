import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.colors.background,
                radius: 30,
                child: const Icon(Icons.thumb_up),
              ),
              title: const Text("Produto"),
              subtitle: const Text("preço"),
              trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(child: Text("Editar")),
                        const PopupMenuItem(child: Text("Excluir")),
                      ]),
            ),
            const Text.rich(TextSpan(
                text: "Agora\n", children: [TextSpan(text: "R\$ 67,50")])),
          ],
        ),
      ),
    );
  }
}
