import 'package:book_list/core/core.dart';
import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../features.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    cubit.fetchBooks();

    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state.status == FavoritesStatus.error) {
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
          backgroundColor: context.colors.neutral.lighterGray,
          appBar: AppBar(title: Text('Favoritos'), backgroundColor: context.colors.neutral.lighterGray),

          body: state.status == FavoritesStatus.loading
              ? DsLoadingComponent()
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.spacingXL.height),
                    child: Column(
                      children: [
                        state.favoriteBooks?.isEmpty == true
                            ? DsNotFoundComponent(message: 'Nenhum livro favoritado', icon: Icons.favorite_border_outlined)
                            : Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                                  itemCount: state.favoriteBooks?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final book = state.favoriteBooks![index];
                                    return BookListItem(
                                      book: book,
                                      onTap: () => context.pushNamed('/bookDetails', extra: book),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
