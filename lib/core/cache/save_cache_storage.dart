abstract class SaveSharedPreferencesStorage {
  Future<void> save({required String key, required List<String> value});
}
