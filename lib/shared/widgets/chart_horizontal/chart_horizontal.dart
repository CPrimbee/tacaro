import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class ChartHorizontal extends StatelessWidget {
  final double percent;
  const ChartHorizontal({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [AppTheme.colors.badColor, AppTheme.colors.primary],
                  stops: [percent, 0.0])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (percent > 0 && percent <= 1)
                  Text(
                    "${(percent * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  ),
                if ((1 - percent) > 0)
                  Text(
                    "${((1 - percent) * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Relação de compras caras e boas compras",
          style: AppTheme.textStyles.hint,
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppTheme.colors.badColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Ruim",
                  style: AppTheme.textStyles.hint,
                )
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppTheme.colors.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Bom",
                  style: AppTheme.textStyles.hint,
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
