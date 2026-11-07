class SkillGroup {
  const SkillGroup({
    required this.title,
    required this.skills,
    this.note,
  });

  final String title;
  final List<String> skills;

  /// One short line under the title.
  final String? note;
}
