import 'package:go_router/go_router.dart';

import '../../features/features.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => makeSplashPage()),
        GoRoute(name: '/books', path: '/books', builder: (context, state) => makeBooksPage()),
        GoRoute(name: '/bookDetails', path: '/bookDetails', builder: (context, state) => makeBookDetailsPage(state.extra as BookEntity)),
        GoRoute(name: '/favorites', path: '/favorites', builder: (context, state) => makeFavoritesPage()),
      ],
    );
  }
}
