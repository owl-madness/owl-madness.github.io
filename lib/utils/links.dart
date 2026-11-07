import 'package:url_launcher/url_launcher.dart';

/// Opens web links in a new tab, mailto links in the same tab, and relative
/// paths (such as the resume PDF) relative to where the site is hosted, so it
/// also works under a GitHub Pages sub-path.
Future<void> openLink(String url) async {
  if (url.isEmpty) return;

  final isMail = url.startsWith('mailto:');
  final isAbsolute =
      url.startsWith('http://') || url.startsWith('https://') || isMail;
  final uri = isAbsolute ? Uri.parse(url) : Uri.base.resolve(url);

  await launchUrl(uri, webOnlyWindowName: isMail ? '_self' : '_blank');
}
