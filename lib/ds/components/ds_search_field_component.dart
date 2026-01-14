import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';

class DsSearchFieldComponent extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? query;
  final bool loading;
  const DsSearchFieldComponent({super.key, required this.onChanged, required this.query, required this.loading});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: context.colors.blue.silver),
    );

    return TextFormField(
      onChanged: onChanged,
      initialValue: query,
      decoration: InputDecoration(
        hintText: 'Buscar por título...',
        prefixIcon: Icon(Icons.search, color: context.colors.blue.silver),
        suffixIcon: loading ? Transform.scale(scale: 0.4, child: CircularProgressIndicator()) : null,
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(borderSide: outlineInputBorder.borderSide.copyWith(color: context.colors.neutral.utilityGray)),
        enabledBorder: outlineInputBorder,
        filled: true,
        fillColor: context.colors.blue.mist,
      ),
    );
  }
}
