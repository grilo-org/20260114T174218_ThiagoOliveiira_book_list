import 'package:book_list/features/books/data/datasource/datasource.dart';
import 'package:book_list/features/books/data/repositories/books_repository_impl.dart';
import 'package:book_list/infra/http/http_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

Widget makeBooksPage() => BlocProvider(create: (_) => makeBooksCubit()..fetchBooks(), child: BooksPage());

BooksCubit makeBooksCubit() => BooksCubit(fetchBooksUsecase: makeFetchBooksUsecase());

HttpClient makeHttpClient() => HttpAdapter(client: Client());

BooksRemoteDatasource makeBooksRemoteDatasource() => BooksRemoteDatasourceImpl(
  client: makeHttpClient(),
  url: makeApiUrl(path: '/books'),
);

BooksRepository makeBooksRepository() => BooksRepositoryImpl(datasource: makeBooksRemoteDatasource());

FetchBooksUsecase makeFetchBooksUsecase() => FetchBooksUsecase(repo: makeBooksRepository());

String makeApiUrl({required String path}) => 'https://681d018ff74de1d219ae8534.mockapi.io/api/v1/$path';
