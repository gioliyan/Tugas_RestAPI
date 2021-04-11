import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:tugas_restapi/models/movie.dart';

class HttpService {
  final String apikey = '6f2b71df04dd0a3dcc8bb37b848fbfb6';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apikey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("fail");
      return null;
    }
  }
}
