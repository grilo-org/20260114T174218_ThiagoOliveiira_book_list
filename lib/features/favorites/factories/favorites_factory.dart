import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../factories/factories.dart';
import '../../features.dart';

Widget makeFavoritesPage() => BlocProvider(create: (_) => makeFavoritesCubit()..fetchBooks(), child: FavoritesPage());

FavoritesCubit makeFavoritesCubit({BookEntity? book}) => FavoritesCubit(
  book: book,
  checkFavoriteItem: makeCheckFavoriteItemUsecase(),
  saveFavorites: makeSaveFavoritesCacheUsecase(),
  loadFavorites: makeLoadFavoritesUseacase(),
  fetchBooksUsecase: makeFetchBooksUsecase(),
);

FavoritesRepository makeFavoritesRepository() => FavoritesRepositoryImpl(localDataSource: makeFavoritesLocalDataSource());

FavoritesLocalDataSource makeFavoritesLocalDataSource() => FavoritesLocalDataSourceImpl(sharedPreferences: makeSharedPreferencesAdapter());

CheckFavoriteItemUsecase makeCheckFavoriteItemUsecase() => CheckFavoriteItemUsecase(repo: makeFavoritesRepository());
SaveFavoritesCacheUsecase makeSaveFavoritesCacheUsecase() => SaveFavoritesCacheUsecase(repo: makeFavoritesRepository());
LoadFavoritesUseacase makeLoadFavoritesUseacase() => LoadFavoritesUseacase(repo: makeFavoritesRepository());
