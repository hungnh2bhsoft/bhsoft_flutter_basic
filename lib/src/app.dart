import 'package:additional_features/src/repositories/image_repository/image_repository.dart';
import 'package:additional_features/src/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ImageRepository(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
