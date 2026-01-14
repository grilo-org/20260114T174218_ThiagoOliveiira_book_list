import 'package:book_list/core/http/domain_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../ds/ds.dart';
import '../../presentation.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BooksCubit>();
    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state.status == BooksStatus.error && state.domainError != DomainError.notFound) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => DsErrorDialog(
              errorMessage: state.domainError?.description(context),
              titleButton: 'Fechar',
              retry: true,
              onTapRetry: () async {
                context.pop();
                await cubit.fetchBooks();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("BookList"),
            backgroundColor: context.colors.neutral.lighterGray,

            actions: [InkWell(onTap: () => context.pushNamed('/favorites'), child: Icon(Icons.favorite_outline))],
            actionsPadding: EdgeInsets.only(right: context.spacing.spacingXL.width),
          ),
          backgroundColor: context.colors.neutral.lighterGray,
          body: Padding(
            padding: EdgeInsets.all(context.spacing.spacingXL.height),
            child: state.status != BooksStatus.loading
                ? Column(
                    children: [
                      DsSearchFieldComponent(onChanged: context.read<BooksCubit>().onQueryChanged, query: state.query, loading: state.status == BooksStatus.searchLoading),
                      SizedBox(height: 15),
                      state.status == BooksStatus.error && state.domainError == DomainError.notFound
                          ? DsNotFoundComponent(message: state.domainError?.description(context) ?? '')
                          : Expanded(
                              child: ListView.separated(
                                separatorBuilder: (_, __) => const SizedBox(height: 8),
                                itemCount: state.books?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final book = state.books![index];
                                  return BookListItem(
                                    book: book,
                                    onTap: () => context.pushNamed('/bookDetails', extra: book),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 10),
                    ],
                  )
                : DsLoadingComponent(),
          ),
        );
      },
    );
  }
}
