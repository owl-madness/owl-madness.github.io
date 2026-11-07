import 'package:flutter/material.dart';

import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'theme/app_theme.dart';
import 'utils/responsive.dart';
import 'widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _navItems = [
    NavItem('About', 'about'),
    NavItem('Experience', 'experience'),
    NavItem('Projects', 'projects'),
    NavItem('Skills', 'skills'),
    NavItem('Contact', 'contact'),
  ];

  final _scrollController = ScrollController();
  final Map<String, GlobalKey> _keys = {
    for (final item in _navItems) item.id: GlobalKey(),
  };

  Duration get _scrollDuration => MediaQuery.disableAnimationsOf(context)
      ? Duration.zero
      : const Duration(milliseconds: 600);

  void _scrollTo(String id) {
    final target = _keys[id]?.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: _scrollDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  void _scrollToTop() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      0,
      duration: _scrollDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        items: _navItems,
        onSelect: _scrollTo,
        onHome: _scrollToTop,
      ),
      // SelectionArea makes all text on the page selectable and copyable.
      // It sits inside the Scaffold so it has an Overlay above it.
      body: SelectionArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const HeroSection(),
              AboutSection(key: _keys['about']),
              ExperienceSection(key: _keys['experience']),
              ProjectsSection(key: _keys['projects']),
              SkillsSection(key: _keys['skills']),
              const EducationSection(),
              ContactSection(key: _keys['contact']),
              const _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.pagePadding(context),
              vertical: 32,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Built with Flutter.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
