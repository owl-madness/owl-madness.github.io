import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class NavItem {
  const NavItem(this.label, this.id);

  final String label;
  final String id;
}

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
    required this.items,
    required this.onSelect,
    required this.onHome,
  });

  final List<NavItem> items;
  final ValueChanged<String> onSelect;
  final VoidCallback onHome;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Material(
      color: AppColors.midnight,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: SizedBox(
          height: 64,
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: Responsive.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.pagePadding(context) - 8,
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: onHome,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.text,
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                      child: const Text(PortfolioData.name),
                    ),
                    const Spacer(),
                    if (mobile)
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.menu, color: AppColors.text),
                        tooltip: 'Menu',
                        color: AppColors.surface,
                        onSelected: onSelect,
                        itemBuilder: (context) => <PopupMenuEntry<String>>[
                          for (final item in items)
                            PopupMenuItem<String>(
                              value: item.id,
                              child: Text(item.label),
                            ),
                        ],
                      )
                    else
                      for (final item in items)
                        TextButton(
                          onPressed: () => onSelect(item.id),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.muted,
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: Text(item.label),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
