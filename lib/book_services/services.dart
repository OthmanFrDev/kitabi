import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../book_model/bookmodel.dart';

class BookServices {
  String genreType = Get.arguments ?? "fiction";
  Future<List<BookModel>> getAllBooks() async {
    try {     
      print('APi Started');
      print(genreType);
      var url1 =
          'https://www.googleapis.com/books/v1/volumes?q=subject:$genreType';


      var response = await http
          .get(Uri.parse(url1))
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Unable to establish connetion . Please try again after sometime');
      });

      if (response.statusCode == 200) {
        print("RANIHNA==============");
        return _parseBookJson(response.body);
      } else {
        print('Null');
        return List.empty();
      }
    } on TimeoutException catch (_) {
      print('Response TimeOUt');
      return List.empty();
    }
  }

  List<BookModel> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap["items"] as List);
    return jsonList
        .map((jsonBook) => BookModel(
      title: jsonBook['volumeInfo']['title'],
      author: jsonBook['volumeInfo']['authors']!=null?jsonBook['volumeInfo']['authors'][0]:"Author Ahmed Sefrioui",
      description: jsonBook['volumeInfo']['description']!=null?jsonBook['volumeInfo']['description']:"Description for this book",
      thumbnailUrl: jsonBook['volumeInfo']['imageLinks']!=null?jsonBook['volumeInfo']['imageLinks']['smallThumbnail']:"https://movies.monnaie-services.com/MA/poster/D4D7DB0E/320/01AF7.jpg",
    )).toList();
  }
}
