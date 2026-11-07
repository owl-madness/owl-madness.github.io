import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SectionWrapper(
      title: 'About',
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < PortfolioData.bio.length; i++) ...[
              Text(PortfolioData.bio[i], style: text.bodyLarge),
              if (i < PortfolioData.bio.length - 1) const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
