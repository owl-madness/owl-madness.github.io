class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.highlights,
  });

  final String company;
  final String role;
  final String period;
  final String location;
  final List<String> highlights;
}

class EducationItem {
  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
  });

  final String degree;
  final String institution;
  final String period;
}
