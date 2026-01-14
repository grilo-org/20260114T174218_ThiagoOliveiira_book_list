// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'books_cubit.dart';

enum BooksStatus { initial, loading, searchLoading, success, error }

class BooksState extends Equatable {
  const BooksState({this.status = BooksStatus.initial, this.books, this.query, this.domainError});

  final BooksStatus status;
  final List<BookEntity>? books;
  final String? query;
  final DomainError? domainError;

  @override
  List get props => [status, books, query, domainError];

  BooksState copyWith({BooksStatus? status, List<BookEntity>? books, String? query, ValueGetter<DomainError?>? domainError}) {
    return BooksState(status: status ?? this.status, books: books ?? this.books, query: query ?? this.query, domainError: domainError != null ? domainError() : this.domainError);
  }
}
