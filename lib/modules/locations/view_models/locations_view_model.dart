import 'package:anime_app/models/location_model.dart';
import 'package:anime_app/modules/locations/locations_repository.dart';
import 'package:flutter/material.dart';

class LocationsViewModel with ChangeNotifier {
  final List<String>locationsUrls;
  final List<LocationModel> locations =[];

  LocationsViewModel({required this.locationsUrls});

  void getLocations()
  {
    for(final url in locationsUrls){
      LocationsRepository.parseLocations(url).then((result){
        locations.addAll(result.data ?? []);
        notifyListeners();
      });
    }

  }
}


