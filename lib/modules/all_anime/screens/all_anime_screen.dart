import 'package:anime_app/global/global_functions/global_functions.dart';
import 'package:anime_app/global/reusable_widgets/MyNetworkImage.dart';
import 'package:anime_app/modules/all_anime/screens/single_anime_screen.dart';
import 'package:anime_app/modules/all_anime/view_models/all_anime_view_model.dart';
import 'package:anime_app/modules/all_anime/view_models/single_anime_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllAnimeScreen extends StatelessWidget {
  const AllAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
        title:const Text(
          'All Anime Films',
        ),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_){
          return AllAnimeViewModel()..getAllAnime().then((result) {
            if (result.statusCode != 200) {
              showSnackBar(context, result.message);
            }
          });
        },
        builder: (context ,_)
        {
          final  viewModel = context.watch<AllAnimeViewModel>();
          final allAnime = viewModel.allAnime;
          return ListView.builder(
              physics:const BouncingScrollPhysics(),
              padding:const EdgeInsets.all(15),
              itemCount: allAnime.length,
              itemBuilder:(context,index) {
                final anime = allAnime[index];
                return InkWell(
                  onTap: ()
                  {
                    navigateTo(context,
                      Provider(
                          create: (context)=> SingleAnimeViewModel(anime: anime),
                          child:const SingleAnimeScreen()
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin:const EdgeInsets.symmetric(vertical:8,) ,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        MyNetworkImage(url: anime.banner),
                        Text(
                          '${anime.title}\n ${anime.japaneseTitle}',
                          textAlign: TextAlign.center,
                          style:const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          anime.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

