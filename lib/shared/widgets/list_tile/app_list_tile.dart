import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.textEnabled,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30,
            child: const Text(
              "12/12",
              style: TextStyle(color: Colors.black),
            ),
          ),
          title: Text(
            "Produto",
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "preço",
            style: AppTheme.textStyles.subtitleListTile,
          ),
          trailing: PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text("Editar")),
                    const PopupMenuItem(child: Text("Excluir")),
                  ]),
        ),
      ),
    );
  }
}
