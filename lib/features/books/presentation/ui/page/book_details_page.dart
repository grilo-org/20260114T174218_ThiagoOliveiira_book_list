import 'package:book_list/core/utils/string_utils.dart';
import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class BookDetailsPage extends StatelessWidget {
  final BookEntity book;
  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
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

          appBar: AppBar(
            title: Text("Detalhes do livro"),
            backgroundColor: context.colors.neutral.lighterGray,
            actions: [
              InkWell(
                onTap: () => cubit.toggle(book.id),
                child: Icon(state.isFavorite ? Icons.favorite_rounded : Icons.favorite_outline, color: state.isFavorite ? Colors.red : null),
              ),
            ],
            actionsPadding: EdgeInsets.only(right: context.spacing.spacingXL.width),
          ),
          body: Padding(
            padding: EdgeInsets.all(context.spacing.spacingXL.height),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.colors.blue.silver),
                        padding: EdgeInsets.all(context.spacing.spacingMD.width),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Título do livro', style: context.fontStyle.displayMedium.copyWith(color: context.colors.neutral.utilityGray)),
                            Text(book.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.spacingMD.height),
                BookItemDetailsComponent(title: 'Autor(es):', description: book.author),
                BookItemDetailsComponent(title: 'Data da publicação', description: StringUtils.formatDate(book.year)),
                BookItemDetailsComponent(title: 'Editora', description: book.publisher),
                SizedBox(height: context.spacing.spacingXL.height),
              ],
            ),
          ),
        );
      },
    );
  }
}
