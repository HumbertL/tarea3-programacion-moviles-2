import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:tarea3pm/bloc/books_bloc_bloc.dart';
import 'package:tarea3pm/classes/BookWidget.dart';

import '../classes/Book.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var _totalamount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Libreria Free to Play'),
        ),
        body: Column(
          children: [
            BlocConsumer<BooksBlocBloc, BooksBlocState>(
                builder: ((context, state) {
              if (state is BooksBlocInitial) {
                return TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingresa Titulo",
                      suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<BooksBlocBloc>(context).add(
                                SearchBook(book_to_search: _totalamount.text));
                          },
                          icon: Icon(Icons.search))),
                );
              }
              return TextField(
                controller: _totalamount,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ingresa Titulo",
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<BooksBlocBloc>(context).add(
                              SearchBook(book_to_search: _totalamount.text));
                        },
                        icon: (state is BooksLoading)
                            ? Icon(Icons.disabled_by_default)
                            : Icon(Icons.search))),
              );
            }), listener: ((context, state) {
              if (state is BookNotFound) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("${state.errormsg}")));
              }
            })),
            BlocBuilder<BooksBlocBloc, BooksBlocState>(
                builder: ((context, state) {
              if (state is BooksBlocInitial) {
                return Expanded(
                  child: Center(
                    child: Text("Ingrese un titulo"),
                  ),
                );
              } else if (state is BooksLoading) {
                return ListTileShimmer();
              } else if (state is BookFound) {
                //print(state.ResponseBody);
                print("Aye let's go");
                return Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      children:
                          List.generate(state.ResponseBody.length, (index) {
                        return (BookWidget(
                            bookObject: state.ResponseBody[index]));
                      })),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Text("Ingrese un titulo"),
                  ),
                );
              }
            }))
          ],
        ));
  }
}
