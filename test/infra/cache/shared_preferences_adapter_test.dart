import 'package:book_list/core/core.dart';
import 'package:book_list/infra/infra.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/domain_error_type.dart';

void main() {
  late SharedPreferencesAdapter sut;
  late String key;
  late List<String> listValue;

  setUp(() {
    key = faker.lorem.word();
    listValue = faker.lorem.sentences(faker.randomGenerator.integer(20));
    sut = SharedPreferencesAdapter();
  });

  group('fetch', () {
    test('Should return empty list if key is not exists', () async {
      SharedPreferences.setMockInitialValues({});

      final result = await sut.fetch(key);

      expect(result, isEmpty);
    });

    test('Should return correct list when key exists', () async {
      SharedPreferences.setMockInitialValues({key: listValue});

      final result = await sut.fetch(key);

      expect(result, listValue);
    });

    test('Should return localCacheError if SharedPreferences error', () async {
      final future = sut.fetch(key);

      expect(future, throwsA(DomainErrorsHandler.domainErrorType(DomainError.localCacheError)));
    });
  });

  group('save', () {
    test('Should return true if save the list correctly', () async {
      SharedPreferences.setMockInitialValues({});

      final result = await sut.save(key: key, value: listValue);

      expect(result, isTrue);
    });
  });
}
