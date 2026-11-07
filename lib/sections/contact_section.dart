import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/links.dart';
import '../widgets/app_button.dart';
import '../widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SectionWrapper(
      title: 'Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              "I'm open to Flutter and mobile roles, and happy to relocate. "
              'Email is the quickest way to reach me.',
              style: text.bodyLarge,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            PortfolioData.email,
            style: text.headlineSmall?.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AppButton(
                label: 'Email me',
                primary: true,
                onPressed: () => openLink(PortfolioData.emailLink),
              ),
              AppButton(
                label: 'LinkedIn',
                onPressed: () => openLink(PortfolioData.linkedInUrl),
              ),
              AppButton(
                label: 'GitHub',
                onPressed: () => openLink(PortfolioData.githubUrl),
              ),
              AppButton(
                label: 'Download resume',
                onPressed: () => openLink(PortfolioData.resumePath),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
