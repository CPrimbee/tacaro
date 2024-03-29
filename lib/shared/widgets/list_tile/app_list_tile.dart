import 'package:flutter/material.dart';
import 'package:tacaro/shared/models/order_model.dart';

import 'package:tacaro/shared/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final OrderModel order;
  const AppListTile({
    Key? key,
    required this.order,
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
            child: Text(
              order.created.split("-").sublist(1).reversed.join("/"),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          title: Text(
            order.name,
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "R\$ ${order.price.toStringAsFixed(2)}",
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
