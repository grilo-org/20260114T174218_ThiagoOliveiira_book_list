import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';

class BookItemDetailsComponent extends StatelessWidget {
  final String title;
  final String description;
  const BookItemDetailsComponent({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: context.spacing.spacingSM.height),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: context.colors.neutral.frostWhite, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.fontStyle.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            Expanded(
              child: Text(description, textAlign: TextAlign.end, style: context.fontStyle.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
