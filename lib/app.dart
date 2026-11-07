import 'package:flutter/material.dart';

import 'data/portfolio_data.dart';
import 'home_page.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} | ${PortfolioData.title}',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
