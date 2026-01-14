import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/core.dart';
import 'ds/ds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookListApp());
}

class BookListApp extends StatefulWidget {
  const BookListApp({super.key});

  @override
  State<BookListApp> createState() => _BookListAppState();
}

class _BookListAppState extends State<BookListApp> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = AppRouter.routes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'BookListApp', debugShowCheckedModeBanner: false, theme: buildLightTheme(), routerConfig: _router);
  }
}
