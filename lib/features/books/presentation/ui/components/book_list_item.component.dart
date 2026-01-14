import 'package:book_list/core/utils/string_utils.dart';
import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';

import '../../../../features.dart';

class BookListItem extends StatelessWidget {
  final BookEntity book;
  final VoidCallback onTap;
  const BookListItem({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: context.spacing.spacingLG.width, top: context.spacing.spacingLG.height),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.colors.blue.mist),
        child: Stack(
          alignment: AlignmentGeometry.bottomRight,
          children: [
            Column(
              spacing: context.spacing.spacingSM.width,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: context.fontStyle.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                Text('Autor(es):'),
                Text(StringUtils.formatAuthorsAbntReference(book.author.split(',').toList())),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: context.spacing.spacingLG.width),
                      child: Text(
                        'Ano da publicação: ${StringUtils.extractYear(book.year)}',
                        style: context.fontStyle.bodyMedium.copyWith(color: context.colors.blue.darker, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: context.spacing.spacingSM.height, horizontal: context.spacing.spacingLG.width),
              decoration: BoxDecoration(
                color: context.colors.neutral.lighterGray,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(context.spacing.spacingSM.width), topLeft: Radius.circular(context.spacing.spacingSM.width)),
              ),
              child: Text(
                'Ver mais',
                style: context.fontStyle.label.copyWith(color: context.colors.blue.darker, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
