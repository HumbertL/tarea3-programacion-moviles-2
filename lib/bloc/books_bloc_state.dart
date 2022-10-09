part of 'books_bloc_bloc.dart';

@immutable
abstract class BooksBlocState extends Equatable {
  const BooksBlocState();
  @override
  List<Object> get props => [];
}

class BooksBlocInitial extends BooksBlocState {}

class BookNotFound extends BooksBlocState {
  final String errormsg;

  BookNotFound({required this.errormsg});
  @override
  List<Object> get props => [errormsg];
}

class BookFound extends BooksBlocState {
  final List<Book> ResponseBody;

  BookFound({required this.ResponseBody});
  @override
  List<Object> get props => [ResponseBody];
}

class BooksLoading extends BooksBlocState {}
