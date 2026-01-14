import '../../../features.dart';

class CheckFavoriteItemUsecase {
  final FavoritesRepository repo;

  CheckFavoriteItemUsecase({required this.repo});

  Future<bool> call(String id) {
    return repo.isFavorite(id);
  }
}
