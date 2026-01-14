import 'package:flutter/material.dart';

class DsNotFoundComponent extends StatelessWidget {
  final String message;
  final IconData? icon;
  const DsNotFoundComponent({super.key, this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(children: [Spacer(), Icon(icon ?? Icons.menu_book, size: 50), Text(message), Spacer()]));
  }
}
