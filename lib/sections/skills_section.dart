import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/skill_group.dart';
import '../utils/responsive.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/tag_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = PortfolioData.skills;
    final stacked = Responsive.isMobile(context);

    return SectionWrapper(
      title: 'Skills',
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  _SkillColumn(group: groups[i]),
                  if (i < groups.length - 1) const SizedBox(height: 40),
                ],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  Expanded(child: _SkillColumn(group: groups[i])),
                  if (i < groups.length - 1) const SizedBox(width: 40),
                ],
              ],
            ),
    );
  }
}

class _SkillColumn extends StatelessWidget {
  const _SkillColumn({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.title, style: text.titleLarge),
        if (group.note != null) ...[
          const SizedBox(height: 6),
          Text(group.note!, style: text.bodySmall),
        ],
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final skill in group.skills) TagChip(skill)],
        ),
      ],
    );
  }
}
