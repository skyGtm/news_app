import 'package:flutter/material.dart';
import 'utils.dart' as Utils;
import 'news.dart';
import 'news_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late List<News> _news;
  // late List<News> _newsInApp;
  var _newsInApp;
  late int _totalNewsItems;

  late Future<List<News>> futureNews;
  @override
  void initState() {
    super.initState();
    futureNews = Utils.getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _newsInApp = snapshot.data;
            _totalNewsItems = _newsInApp.length;
            NewsData.newsList = _newsInApp;

            // print("News Data: ${_newsInApp[1].author}");
            // print("News Data: ${_newsInApp[2].author}");
            // print("News Data: ${_newsInApp[3].author}");
            // print('Total News Items: $_totalNewsItems');
            return ListView.builder(
              itemCount: _totalNewsItems,
              itemBuilder: (context, index) {
                return _listItem(index);
              },
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Error Fetching Data : ${snapshot.error}',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        'Reload',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          futureNews = Utils.getNewsData();
                        });
                      },
                    )
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // body: ListView.builder(
      //     itemCount: 20,
      //     itemBuilder: (context, index) {
      //       return _listItem(index);
      //     },),
    );
  }

  Widget _listItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NewsDetail(index: index);
            },
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 1, top: 1, bottom: 1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _newsInApp[index].title,
                          // 'News Title is so long that you cannot fit in a single line. Therefore you have to find the error',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _newsInApp[index].author,
                          // 'News Author',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 18,
                    color: Colors.black26,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NewsDetail(index: index);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                  child: Divider(
                height: 15,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
