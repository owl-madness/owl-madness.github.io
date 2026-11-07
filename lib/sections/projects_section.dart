import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';
import '../widgets/project_grid.dart';
import '../widgets/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final all = PortfolioData.projects;

    final featured = all.where((p) => p.featured).toList();
    final company = all
        .where((p) => !p.featured && p.kind == ProjectKind.company)
        .toList();
    final personal = all
        .where((p) => !p.featured && p.kind == ProjectKind.personal)
        .toList();

    return SectionWrapper(
      title: 'Projects',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final project in featured) ...[
            ProjectCard(project: project),
            const SizedBox(height: 56),
          ],
          Text('More work projects', style: text.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Employer and client apps, described without screenshots.',
            style: text.bodySmall,
          ),
          const SizedBox(height: 24),
          ProjectGrid(projects: company),
          const SizedBox(height: 56),
          Text('Personal projects', style: text.headlineSmall),
          const SizedBox(height: 24),
          ProjectGrid(projects: personal),
        ],
      ),
    );
  }
}
