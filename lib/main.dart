import 'package:flutter/material.dart';
import 'modules/all_anime/screens/all_anime_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade300
      ),
      home:const AllAnimeScreen(),
    );
  }
}

