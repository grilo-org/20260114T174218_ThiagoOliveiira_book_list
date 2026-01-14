import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final SaveFavoritesCacheUsecase saveFavorites;
  final CheckFavoriteItemUsecase checkFavoriteItem;
  final LoadFavoritesUseacase loadFavorites;
  final BookEntity? book;
  final FetchBooksUsecase fetchBooksUsecase;

  FavoritesCubit({required this.book, required this.fetchBooksUsecase, required this.saveFavorites, required this.checkFavoriteItem, required this.loadFavorites}) : super(FavoritesState([]));

  Future<void> initial() async {
    try {
      if (book != null) emit(state.copyWith(ids: await loadFavorites.call(), isFavorite: await isFavorite(book!.id)));
    } on CustomDomainException catch (e) {
      emit(state.copyWith(status: FavoritesStatus.error, domainError: () => e.domainError));
    }
  }

  Future<void> toggle(String id) async {
    try {
      await saveFavorites.call(id: id);
      emit(state.copyWith(ids: await loadFavorites.call(), isFavorite: await isFavorite(id)));
    } on CustomDomainException catch (e) {
      emit(state.copyWith(status: FavoritesStatus.error, domainError: () => e.domainError));
    }
  }

  Future<bool> isFavorite(String id) => checkFavoriteItem.call(id);

  Future<void> fetchBooks() async {
    try {
      emit(state.copyWith(status: FavoritesStatus.loading));
      emit(state.copyWith(ids: await loadFavorites.call()));
      final result = await fetchBooksUsecase.call();

      List<BookEntity> favoriteBooks = result.where((book) => state.ids.contains(book.id)).toList();

      emit(state.copyWith(status: FavoritesStatus.success, favoriteBooks: favoriteBooks));
    } on CustomDomainException catch (e) {
      emit(state.copyWith(status: FavoritesStatus.error, domainError: () => e.domainError));
    }
  }
}
