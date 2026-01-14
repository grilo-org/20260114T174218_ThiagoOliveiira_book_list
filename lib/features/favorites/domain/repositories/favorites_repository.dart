abstract class FavoritesRepository {
  Future<bool> isFavorite(String id);
  void save(String id);
  Future<List<String>> all();
}
