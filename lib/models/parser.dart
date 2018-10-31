import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:xml/xml.dart' as xml;

class Parser {
  final url = "https://www.france24.com/fr/actualites/rss";

  Future chargeRSS() async {
    final reponse = await get(url);
    if (reponse.statusCode == 200) {
      final feed = RssFeed.parse(reponse.body);
      print(xml.parse(reponse.body));
      return feed;
    } else {
      return print('error :${reponse.statusCode}');
    }
  }
}
