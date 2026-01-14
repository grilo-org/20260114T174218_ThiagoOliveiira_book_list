import '../domain.dart';

class LoadFavoritesUseacase {
  final FavoritesRepository repo;

  LoadFavoritesUseacase({required this.repo});

  Future<List<String>> call() {
    return repo.all();
  }
}
