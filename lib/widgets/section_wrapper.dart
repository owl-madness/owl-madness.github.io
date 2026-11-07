import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Full-width band with a hairline on top, a content column capped at
/// [Responsive.maxContentWidth], and a heading.
class SectionWrapper extends StatelessWidget {
  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.pagePadding(context),
              vertical: mobile ? 56 : 88,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 40),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
