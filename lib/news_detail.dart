import 'package:flutter/material.dart';
import 'news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({required this.index});

  late final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue[400],
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'News Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: NewsDetailBody(index),
    );
  }
}

class NewsDetailBody extends StatelessWidget {
  NewsDetailBody(this.index);

  late final int index;
  late final News _data;
  late final screenWidth;
  @override
  Widget build(BuildContext context) {
    _data = NewsData.newsList[index];
    screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(image: NetworkImage(_data.image)),
          FadeInImage.assetNetwork(
            placeholder: 'images/image_placeholder.png',
            image: _data.image,
          ),
          Text(
            // 'Title: This is the News Title. Too Long Dont Read',
            _data.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Author: Dont Read',
                      _data.author,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      // 'Publisher: Dont Read',
                      _data.publisher,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                // 'Date: 2020-05-28',
                _data.date,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
            child: Divider(
              thickness: 2.0,
            ),
          ),
          Text(
            // Utils.getNewDetailsText(),
            _data.text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Center(
            child: SizedBox(
              height: 45,
              width: screenWidth * 0.5,
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () => {_launchUrl(_data.url)},
              color: Colors.blue,
              child: Text(
                'Read More',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

void _launchUrl(String url) async {
  await canLaunch(url) ? await launch(url) : print('Cannot Launch Url');
}
