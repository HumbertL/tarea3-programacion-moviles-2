import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../classes/Book.dart';

part 'books_bloc_event.dart';
part 'books_bloc_state.dart';

class BooksBlocBloc extends Bloc<BooksBlocEvent, BooksBlocState> {
  BooksBlocBloc() : super(BooksBlocInitial()) {
    on<SearchBook>(_searchingBook);
  }
  Future<FutureOr<void>> _searchingBook(SearchBook event, emit) async {
    final String booklink =
        "https://www.googleapis.com/books/v1/volumes?q=${event.book_to_search}";
    emit(BooksLoading());
    dynamic json = await _searchsongInLibrary(booklink);
    List<Book> listalibros = [];
    if (json != null) {
      for (dynamic item in json['items']) {
        Map<String, dynamic> map = item['volumeInfo'];
        Book book = Book.fromJson(map);
        listalibros.add(book);
      }
      emit(BookFound(ResponseBody: listalibros));
    } else {
      emit(BookNotFound(errormsg: "No se encontro un libro"));
    }
  }

  Future<dynamic> _searchsongInLibrary(String link) async {
    var uri = Uri.parse(link);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else
      return null;
  }
}
