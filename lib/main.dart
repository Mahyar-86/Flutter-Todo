import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();
  //open a hive box to store data
	await Hive.openBox("myBox");
  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //delete debug banner
      debugShowCheckedModeBanner: false,
      //open home page
      home: const HomePage(),
      //set a theme
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
