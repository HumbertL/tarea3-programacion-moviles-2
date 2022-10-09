part of 'books_bloc_bloc.dart';

@immutable
abstract class BooksBlocEvent extends Equatable {
  const BooksBlocEvent();

  @override
  List<Object> get props => [];
}

class SearchBook extends BooksBlocEvent {
  final String book_to_search;
  @override
  SearchBook({required this.book_to_search});
  List<Object> get props => [book_to_search];
}
