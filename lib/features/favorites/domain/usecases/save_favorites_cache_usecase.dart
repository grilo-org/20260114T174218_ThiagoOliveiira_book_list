import '../../../features.dart';

class SaveFavoritesCacheUsecase {
  final FavoritesRepository repo;

  SaveFavoritesCacheUsecase({required this.repo});

  Future<void> call({required String id}) async {
    repo.save(id);
  }
}
