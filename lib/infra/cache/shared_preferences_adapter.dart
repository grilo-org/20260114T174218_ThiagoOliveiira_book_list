import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';

class SharedPreferencesAdapter implements FetchSharedPreferencesStorage, SaveSharedPreferencesStorage {
  @override
  Future<List<String>> fetch(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getStringList(key) ?? [];
    } catch (e) {
      throw CustomDomainException(domainError: DomainError.localCacheError);
    }
  }

  @override
  Future<bool> save({required String key, required List<String> value}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      return await sharedPreferences.setStringList(key, value);
    } catch (e) {
      throw CustomDomainException(domainError: DomainError.localCacheError);
    }
  }
}
