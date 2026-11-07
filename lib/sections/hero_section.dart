import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/links.dart';
import '../utils/responsive.dart';
import '../widgets/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final size = Responsive.of(context);
    final mobile = size == ScreenSize.mobile;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    final nameStyle = switch (size) {
      ScreenSize.desktop => text.displayLarge,
      ScreenSize.tablet => text.displayMedium,
      ScreenSize.mobile => text.displayMedium?.copyWith(fontSize: 38),
    };

    final pad = Responsive.pagePadding(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            pad,
            mobile ? 64 : 120,
            pad,
            mobile ? 56 : 96,
          ),
          // The one entrance animation on the site: the hero fades in once.
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: reduceMotion ? 1 : 0, end: 1),
            duration:
                reduceMotion ? Duration.zero : const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            builder: (context, value, child) =>
                Opacity(opacity: value, child: child),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(PortfolioData.name, style: nameStyle),
                const SizedBox(height: 20),
                Text(
                  PortfolioData.title,
                  style: text.headlineSmall?.copyWith(color: AppColors.accent),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Text(PortfolioData.pitch, style: text.bodyLarge),
                ),
                const SizedBox(height: 36),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    AppButton(
                      label: 'Download resume',
                      primary: true,
                      onPressed: () => openLink(PortfolioData.resumePath),
                    ),
                    AppButton(
                      label: 'Email me',
                      onPressed: () => openLink(PortfolioData.emailLink),
                    ),
                    AppButton(
                      label: 'GitHub',
                      onPressed: () => openLink(PortfolioData.githubUrl),
                    ),
                    AppButton(
                      label: 'LinkedIn',
                      onPressed: () => openLink(PortfolioData.linkedInUrl),
                    ),
                  ],
                ),
                const SizedBox(height: 56),
                Wrap(
                  spacing: 32,
                  runSpacing: 16,
                  children: [
                    for (final fact in PortfolioData.facts)
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(color: AppColors.accent, width: 2),
                          ),
                        ),
                        child: Text(fact, style: text.bodyMedium),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
