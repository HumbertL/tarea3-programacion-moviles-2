import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea3pm/pages/HomePage.dart';
import 'package:tarea3pm/bloc/books_bloc_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: BlocProvider(
          create: (context) => BooksBlocBloc(),
          child: HomePage(),
        ));
    //HomePage());
  }
}
