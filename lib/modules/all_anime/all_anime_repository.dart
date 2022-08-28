import 'dart:convert';
import 'dart:io';
import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/models/response_model.dart';
import 'package:anime_app/modules/all_anime/all_anime_service.dart';

class AllAnimeRepository {
  AllAnimeRepository._();

  static Future<ResponseModel<List<AnimeModel>>> parseAllAnime() async {
    try {
      final response = await AllAnimeService.fetchAllAnime();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = AnimeModel.parseList(
          result.cast<Map<String, dynamic>>(),
        );

        return ResponseModel(
          statusCode: response.statusCode,
          data: animeModels,
        );
      } else {
        return ResponseModel(
          statusCode: -1,
          message: 'An error occurred',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel(
          statusCode: -1,
          message: 'Check your internet connection',
        );
      }

      return ResponseModel(
        statusCode: -1,
        message: 'An error occurred',
      );
    }
  }
}
