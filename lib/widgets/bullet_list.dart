import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BulletList extends StatelessWidget {
  const BulletList(this.items, {super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 12),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(child: Text(items[i], style: style)),
              ],
            ),
          ),
      ],
    );
  }
}
