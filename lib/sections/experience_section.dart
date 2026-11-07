import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/experience.dart';
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
              leading: Text(items[i].period, style: text.titleMedium),
              content: _ExperienceSummary(item: items[i]),
            ),
        ],
      ),
    );
  }
}

class _ExperienceSummary extends StatelessWidget {
  const _ExperienceSummary({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.company, style: text.titleLarge),
              const SizedBox(height: 4),
              Text(
                item.role,
                style: text.bodyMedium?.copyWith(color: AppColors.accent),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        TextButton.icon(
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => _ExperienceDialog(item: item),
          ),
          style: TextButton.styleFrom(foregroundColor: AppColors.accent),
          icon: const Icon(Icons.chevron_right, size: 20),
          iconAlignment: IconAlignment.end,
          label: const Text('Details'),
        ),
      ],
    );
  }
}

class _ExperienceDialog extends StatelessWidget {
  const _ExperienceDialog({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.line),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        // The dialog lives above the page's SelectionArea, so it needs its
        // own to keep the text copyable.
        child: SelectionArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.company, style: text.titleLarge),
                          const SizedBox(height: 4),
                          Text(
                            item.role,
                            style: text.bodyMedium
                                ?.copyWith(color: AppColors.accent),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${item.period}, ${item.location}',
                            style: text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'Close',
                      color: AppColors.muted,
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                BulletList(item.highlights),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
