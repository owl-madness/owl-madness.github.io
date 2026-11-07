import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primary = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    const padding = EdgeInsets.symmetric(horizontal: 22, vertical: 18);
    const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

    if (primary) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.midnight,
          padding: padding,
          shape: shape,
          textStyle: textStyle,
        ),
        child: Text(label),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.text,
        side: const BorderSide(color: AppColors.line),
        padding: padding,
        shape: shape,
        textStyle: textStyle,
      ),
      child: Text(label),
    );
  }
}
