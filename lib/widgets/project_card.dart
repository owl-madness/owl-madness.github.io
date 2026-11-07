import 'package:flutter/material.dart';

import '../models/project.dart';
import '../theme/app_theme.dart';
import '../utils/links.dart';
import 'app_button.dart';
import 'bullet_list.dart';
import 'tag_chip.dart';

/// A project panel. The featured project is always open; others open on tap.
class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final text = Theme.of(context).textTheme;
    final featured = project.featured;
    final open = featured || _open;
    final instant = MediaQuery.disableAnimationsOf(context);

    final meta = [
      if (project.org != null) project.org!,
      if (project.status != null) project.status!,
    ].join(', ');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(featured ? 32 : 24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: featured ? text.headlineSmall : text.titleLarge,
          ),
          if (meta.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(meta, style: text.bodySmall),
          ],
          const SizedBox(height: 14),
          Text(project.summary, style: text.bodyMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final item in project.stack) TagChip(item)],
          ),
          AnimatedSize(
            duration: instant ? Duration.zero : const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            alignment: Alignment.topLeft,
            child: open
                ? _ProjectDetails(project: project)
                : const SizedBox(width: double.infinity),
          ),
          if (!featured) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => setState(() => _open = !_open),
                style: TextButton.styleFrom(foregroundColor: AppColors.accent),
                icon: Icon(
                  _open ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                ),
                label: Text(_open ? 'Hide details' : 'Show details'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        if (project.role != null) ...[
          Text('My role', style: text.titleMedium),
          const SizedBox(height: 8),
          Text(
            project.role!,
            style: text.bodyMedium?.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 20),
        ],
        if (project.features.isNotEmpty) ...[
          Text('Features', style: text.titleMedium),
          const SizedBox(height: 12),
          BulletList(project.features),
        ],
        if (project.screenshots.isNotEmpty) ...[
          const SizedBox(height: 24),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: project.screenshots.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  project.screenshots[index],
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) =>
                      const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
        if (project.links.isNotEmpty) ...[
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final link in project.links)
                AppButton(
                  label: link.label,
                  onPressed: () => openLink(link.url),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
