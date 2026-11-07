import 'package:flutter/material.dart';

import '../models/project.dart';
import 'project_card.dart';

/// Two columns when there is room, one on narrow screens.
class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 20.0;
        final columns = constraints.maxWidth >= 760 ? 2 : 1;
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final project in projects)
              SizedBox(width: width, child: ProjectCard(project: project)),
          ],
        );
      },
    );
  }
}
