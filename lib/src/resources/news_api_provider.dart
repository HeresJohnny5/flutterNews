import 'package:http/http.dart' show Client;
import 'dart:convert';

// LOCAL IMPORTS
import '../models/item_model.dart';

// any variable declared inside a file w/out a prefixed underscore is exported and can be used by the entire app
final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  // whenever you use the await keyword you have to mark the enclosing function with the async keyword. 
  // this informs Dart that the function contains a Future and it needs to at some point wait for that Future to be resolved before continuing execution of the function

  fetchTopIds() async {
    final response = await client.get('${_root}/topstories.json');
    final ids = json.decode(response.body); // data coming back from the request is available on the response.body

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('${_root}/item/${id}.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}