import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final FetchBooksUsecase fetchBooksUsecase;
  Timer? _debounce;

  BooksCubit({required this.fetchBooksUsecase}) : super(BooksState());

  Future<void> fetchBooks() async {
    try {
      emit(state.copyWith(status: BooksStatus.loading));
      final result = await fetchBooksUsecase.call();

      emit(state.copyWith(status: BooksStatus.success, books: result));
    } on CustomDomainException catch (e) {
      emit(state.copyWith(status: BooksStatus.error, domainError: () => e.domainError));
    }
  }

  void onQueryChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () async {
      emit(state.copyWith(status: BooksStatus.searchLoading, query: q));
      try {
        final res = await fetchBooksUsecase(query: q.trim());
        emit(state.copyWith(status: BooksStatus.success, books: res));
      } on CustomDomainException catch (e) {
        emit(state.copyWith(status: BooksStatus.error, domainError: () => e.domainError));
      }
    });
  }
}
