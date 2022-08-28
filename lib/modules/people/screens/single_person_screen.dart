import 'package:anime_app/modules/people/view_models/single_person_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePersonScreen extends StatelessWidget {
  const SinglePersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SinglePersonViewModel>();
    final person = viewModel.person;
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(person.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height:double.infinity ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ID : ${person.id}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    'Name : ${person.name}',
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
              ),
              Text(
                'Age : ${person.age}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'eyeColor : ${person.eyeColor}',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Text(
                'hairColor : ${person.hairColor}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Gender : ${person.gender.name}',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
