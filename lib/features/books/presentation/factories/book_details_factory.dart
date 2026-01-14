import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features.dart';

Widget makeBookDetailsPage(BookEntity book) => BlocProvider(
  create: (context) => makeFavoritesCubit(book: book)..initial(),
  child: BookDetailsPage(book: book),
);
