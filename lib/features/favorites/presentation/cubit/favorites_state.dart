// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_cubit.dart';

enum FavoritesStatus { initial, loading, success, error }

class FavoritesState extends Equatable {
  final FavoritesStatus status;
  final List<String> ids;
  final bool isFavorite;
  final List<BookEntity>? favoriteBooks;
  final DomainError? domainError;

  const FavoritesState(this.ids, {this.isFavorite = false, this.favoriteBooks, this.status = FavoritesStatus.initial, this.domainError});

  @override
  List get props => [ids, isFavorite, favoriteBooks, status, domainError];

  FavoritesState copyWith({List<String>? ids, bool? isFavorite, List<BookEntity>? favoriteBooks, FavoritesStatus? status, ValueGetter<DomainError?>? domainError}) {
    return FavoritesState(
      ids ?? this.ids,
      isFavorite: isFavorite ?? this.isFavorite,
      favoriteBooks: favoriteBooks ?? this.favoriteBooks,
      status: status ?? this.status,
      domainError: domainError != null ? domainError() : this.domainError,
    );
  }
}
