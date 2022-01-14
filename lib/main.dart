import 'package:additional_features/src/repositories/sql_repository/sql_repository.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sqliteRepository = SqliteRepository.instance;
  final dogs = await sqliteRepository.getAllDogs();
  dogs.forEach(print);
  runApp(const MyApp());
}
