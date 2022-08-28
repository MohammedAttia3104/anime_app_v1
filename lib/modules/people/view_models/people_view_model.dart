import 'package:anime_app/models/person_model.dart';
import 'package:anime_app/modules/people/people_repository.dart';
import 'package:flutter/material.dart';


class PeopleViewModel with ChangeNotifier {
  final List<String>peopleUrls;
  final List<PersonModel> people =[];

  PeopleViewModel({required this.peopleUrls});

  void getPeople()
  {
    for(final url in peopleUrls){
      PeopleRepository.parsePeople(url).then((result){
        people.addAll(result.data ?? []);
        notifyListeners();
      });
    }

  }
}
