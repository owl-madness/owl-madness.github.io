import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Builds the accessibility tree from the start, so screen readers and
  // browser find-in-page can read the text of this canvas-based site.
  SemanticsBinding.instance.ensureSemantics();
  runApp(const PortfolioApp());
}
