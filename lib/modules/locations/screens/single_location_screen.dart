import 'package:anime_app/modules/locations/view_models/single_location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleLocationScreen extends StatelessWidget {
  const SingleLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleLocationViewModel>();
    final location = viewModel.location;
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(location.name),
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
                'ID : ${location.id}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Name : ${location.name}',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Text(
                'Climate : ${location.climate}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Terrain : ${location.terrain}',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Text(
                'SurfaceWater : ${location.surfaceWater}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
