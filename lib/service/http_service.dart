import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  final String apikey = '6f2b71df04dd0a3dcc8bb37b848fbfb6';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apikey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      String response = result.body;
      return response;
    } else {
      print("fail");
      return null;
    }
  }
}
