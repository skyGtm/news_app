import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news.dart';

Future<List<News>> getNewsData() async {
  Uri uri = Uri.parse('http://www.mocky.io/v2/5ecfddf13200006600e3d6d0');

  var response = await http.get(uri);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return List.generate(data.length, (index) {
      // print('Data at Index : $index = ${data[index]}');
      return News.fromJson(data[index]);
    });
  }
  throw ('Utils: Fetching data: ${response.statusCode}');
}

String getNewDetailsText() {
  return "What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after : What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after: What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after:What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after: What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after:What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after:What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after:What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after:What you need to know\n\n\nApple Arcade is getting a big new game this week.\nSpongeBob: Patty Pursuit will debut tomorrow.\nApple Arcade tweeted a teaser but no gameplay details.\n\n\nOne to look forward to.\n\nApple Arcade is getting a new Spongebob game tomorrow after";
}
