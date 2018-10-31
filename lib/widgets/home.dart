import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flux/models/parser.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  RssFeed feed;

  @override
  void initState() {
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              onPressed: null,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: new ListView(
        children: <Widget>[],
      ),
    );
  }

  
  Future parse() async {
    RssFeed recu = await Parser().chargeRSS();
    List<RssItem> l= [];
    if (recu != null) {
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
         
        });
      });
    }
  }

  /*Future parse() async {
    RssFeed recu = await Parser().chargeRSS();
    if (recu != null) {
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
          print(item.title);
          print(item.description);
          print(item.pubDate);
          print(item.enclosure.url);
        });
      });
    }
  }*/
}
