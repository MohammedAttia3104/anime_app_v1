import 'package:anime_app/global/global_functions/global_functions.dart';
import 'package:anime_app/modules/people/screens/single_person_screen.dart';
import 'package:anime_app/modules/people/view_models/people_view_model.dart';
import 'package:anime_app/modules/people/view_models/single_person_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PeopleViewModel>();
    final people = viewModel.people;
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'People',
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
              for(final person in people)
                InkWell(
                  onTap: (){
                    navigateTo(context,Provider(
                        create: (_) {
                          return  SinglePersonViewModel(person: person);
                        },
                        child: const SinglePersonScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(person.name),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
