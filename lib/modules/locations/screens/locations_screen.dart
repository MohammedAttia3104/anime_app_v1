import 'package:anime_app/global/global_functions/global_functions.dart';
import 'package:anime_app/modules/locations/screens/single_location_screen.dart';
import 'package:anime_app/modules/locations/view_models/locations_view_model.dart';
import 'package:anime_app/modules/locations/view_models/single_location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationsViewModel>();
    final locations = viewModel.locations;
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Locations',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          child: ListView(
            children: [
              for(final location in locations)
                InkWell(
                  onTap: (){
                    navigateTo(context, Provider(
                        create: (_) {
                          return SingleLocationViewModel(location: location);
                        },
                        child: const SingleLocationScreen(),
                    ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(location.name),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
