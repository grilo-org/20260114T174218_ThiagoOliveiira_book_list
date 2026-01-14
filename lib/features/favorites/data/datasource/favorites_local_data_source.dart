import '../../../../infra/infra.dart';

abstract class FavoritesLocalDataSource {
  Future<List<String>> loadFavorites();
  Future<bool> saveFavorites(List<String> favorites);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const _key = 'favorites';
  final SharedPreferencesAdapter sharedPreferences;

  FavoritesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<String>> loadFavorites() async {
    final prefs = await sharedPreferences.fetch(_key);
    return prefs;
  }

  @override
  Future<bool> saveFavorites(List<String> favorites) async {
    return await sharedPreferences.save(key: _key, value: favorites);
  }
}
