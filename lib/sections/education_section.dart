import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/timeline_row.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final items = PortfolioData.education;

    return SectionWrapper(
      title: 'Education',
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            TimelineRow(
              first: i == 0,
              last: i == items.length - 1,
              leading: Text(items[i].period, style: text.titleMedium),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[i].degree, style: text.titleLarge),
                  const SizedBox(height: 4),
                  Text(items[i].institution, style: text.bodySmall),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
