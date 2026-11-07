import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// One entry in a chronological list: a narrow "when" column on the left and
/// the details on the right. Stacks on mobile.
class TimelineRow extends StatelessWidget {
  const TimelineRow({
    super.key,
    required this.leading,
    required this.content,
    this.first = false,
    this.last = false,
  });

  final Widget leading;
  final Widget content;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: first ? 0 : 32, bottom: last ? 0 : 32),
      decoration: first
          ? null
          : const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.line)),
            ),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [leading, const SizedBox(height: 12), content],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 240, child: leading),
                Expanded(child: content),
              ],
            ),
    );
  }
}
