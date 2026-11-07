import 'package:flutter/widgets.dart';

enum ScreenSize { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static const double mobileMax = 700;
  static const double tabletMax = 1100;
  static const double maxContentWidth = 1100;

  static ScreenSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < mobileMax) return ScreenSize.mobile;
    if (width < tabletMax) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static double pagePadding(BuildContext context) {
    switch (of(context)) {
      case ScreenSize.mobile:
        return 20;
      case ScreenSize.tablet:
        return 32;
      case ScreenSize.desktop:
        return 48;
    }
  }
}
