import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: "dadosBanco.env");
  runApp(const MyApp());
}




