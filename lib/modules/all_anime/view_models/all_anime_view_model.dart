import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/models/response_model.dart';
import 'package:anime_app/modules/all_anime/all_anime_repository.dart';
import 'package:flutter/material.dart';

class AllAnimeViewModel with ChangeNotifier {
  var allAnime =<AnimeModel>[];

  Future<ResponseModel<List<AnimeModel>>> getAllAnime()async{
    final result = await AllAnimeRepository.parseAllAnime();
    if(result.statusCode==200)
      {
        allAnime = result.data ?? [];
        notifyListeners();
      }
    return result;
  }

}
