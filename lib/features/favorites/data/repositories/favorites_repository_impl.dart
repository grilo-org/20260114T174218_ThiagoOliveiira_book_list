import '../../domain/domain.dart';
import '../data.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  List<String> _ids = [];

  FavoritesRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> isFavorite(String id) async {
    await init();
    final teste = _ids.contains(id);
    return teste;
  }

  @override
  Future<List<String>> all() async => await localDataSource.loadFavorites();

  Future<void> init() async {
    _ids = await localDataSource.loadFavorites();
  }

  @override
  Future<bool> save(String id) async {
    await init();
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }

    final resut = await localDataSource.saveFavorites(_ids);

    return resut;
  }
}
