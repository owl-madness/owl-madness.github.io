import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
