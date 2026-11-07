import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/bullet_list.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/timeline_row.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final items = PortfolioData.experience;

    return SectionWrapper(
      title: 'Experience',
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            TimelineRow(
              first: i == 0,
              last: i == items.length - 1,
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[i].period, style: text.titleMedium),
                  const SizedBox(height: 4),
                  Text(items[i].location, style: text.bodySmall),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[i].company, style: text.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    items[i].role,
                    style: text.bodyMedium?.copyWith(color: AppColors.accent),
                  ),
                  const SizedBox(height: 16),
                  BulletList(items[i].highlights),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
