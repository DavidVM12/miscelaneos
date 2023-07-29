import 'package:share_plus/share_plus.dart';

class SharePlugins {
  static void sharedLink(String link, String subject) {
    Share.share(link, subject: subject);
  }
}
