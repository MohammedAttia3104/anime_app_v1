import 'package:anime_app/global/global_functions/global_functions.dart';
import 'package:anime_app/global/reusable_widgets/ItemContianer.dart';
import 'package:anime_app/global/reusable_widgets/MyNetworkImage.dart';
import 'package:anime_app/modules/all_anime/view_models/single_anime_view_model.dart';
import 'package:anime_app/modules/locations/screens/locations_screen.dart';
import 'package:anime_app/modules/people/view_models/people_view_model.dart';
import 'package:anime_app/modules/species/screens/species_screen.dart';
import 'package:anime_app/modules/vehicles/screens/vehicles_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../people/screens/people_screen.dart';

class SingleAnimeScreen extends StatelessWidget {
  const SingleAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleAnimeViewModel>();
    final anime = viewModel.anime;
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyNetworkImage(url: anime.banner,),
              const SizedBox(height: 8,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          anime.title,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          anime.japaneseTitle,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          anime.description,
                          style:const TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      children: [
                        MyNetworkImage(url: anime.image,),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ChangeNotifierProvider(
                        create: (context) => PeopleViewModel(peopleUrls: anime.people)..getPeople(),
                      child: const PeopleScreen(),
                    ),);
                  },
                    child:const ItemContianer(itemName: 'People'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: (){
                    navigateTo(context, const LocationsScreen() );
                  },
                  child:const ItemContianer(itemName: 'Locations'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: (){
                    navigateTo(context, const SpeciesScreen() );
                  },
                  child:const ItemContianer(itemName: 'Species'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: (){
                    navigateTo(context, const VehiclesScreen() );
                  },
                  child:const ItemContianer(itemName: 'Vehicles'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
