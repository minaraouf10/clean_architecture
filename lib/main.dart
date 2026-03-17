import 'package:clean_architecture/core/services/services_locator.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:Colors.grey.shade900 ,
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:const MoviesScreen(),
    );
  }
}