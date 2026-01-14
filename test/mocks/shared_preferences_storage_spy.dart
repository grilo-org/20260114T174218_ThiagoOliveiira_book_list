import 'package:book_list/core/core.dart';
import 'package:mocktail/mocktail.dart';

class SharedPreferencesStorageSpy extends Mock implements FetchSharedPreferencesStorage, SaveSharedPreferencesStorage {
  SharedPreferencesStorageSpy() {
    mockSave();
  }

  When mockFetchCall() => when(() => fetch(any()));
  void mockFetch(bool? data) => mockFetchCall().thenAnswer((_) async => data);
  void mockFetchError() => mockFetchCall().thenThrow(CustomDomainException(domainError: DomainError.localCacheError));

  When mockSaveCall() => when(
    () => save(
      key: any(named: 'key'),
      value: any(named: 'value'),
    ),
  );
  void mockSave() => mockSaveCall().thenAnswer((value) async => value);
  void mockSaveError() => mockSaveCall().thenThrow(CustomDomainException(domainError: DomainError.localCacheError));
}
