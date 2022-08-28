import 'package:anime_app/global/constants.dart';
import 'package:http/http.dart' as http;

class AllAnimeService {
  AllAnimeService._();

  static Future<http.Response> fetchAllAnime() async {
    final Uri uri = Uri.parse('$endpoint/films');
    return await http.get(uri);
  }
}