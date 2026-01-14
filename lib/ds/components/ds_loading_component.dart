import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';

class DsLoadingComponent extends StatelessWidget {
  const DsLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: context.colors.blue.dark));
  }
}
