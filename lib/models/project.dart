enum ProjectKind { company, personal }

class ProjectLink {
  const ProjectLink({required this.label, required this.url});

  final String label;
  final String url;
}

class Project {
  const Project({
    required this.name,
    required this.summary,
    required this.kind,
    required this.stack,
    this.org,
    this.role,
    this.status,
    this.features = const [],
    this.links = const [],
    this.screenshots = const [],
    this.featured = false,
  });

  final String name;
  final String summary;
  final ProjectKind kind;
  final List<String> stack;

  /// Company the work was done for, for example "XGen Business Systems".
  final String? org;

  /// What you personally did. Keep it specific and honest.
  final String? role;

  /// For example "In progress". Shown on the card when set.
  final String? status;

  final List<String> features;

  /// Store, GitHub or demo links. Leave empty until you have real ones.
  final List<ProjectLink> links;

  /// Asset paths under assets/images/projects/. Personal projects only,
  /// unless your employer has approved showing the screens.
  final List<String> screenshots;

  /// The flagship project is shown first and larger.
  final bool featured;
}
