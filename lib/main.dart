import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/BlocImport.dart';
import 'package:news/pages/NewsSource_page.dart';
import 'package:news/style/styleImport.dart';

void main() {
   runApp(    
     BlocProvider(
      create: (context) =>NewsBloc(),
      child: MyApp(),
    ),
    );
   }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorPrimary,
      ),
      home: NewsSourcePage(),
    );
  }
}
