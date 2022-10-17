import 'package:url_launcher/url_launcher.dart';

class Functions {
  static Future<void> openLinkInBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
