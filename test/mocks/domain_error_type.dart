import 'package:book_list/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

class DomainErrorsHandler {
  static Matcher domainErrorType(DomainError domainError) => predicate((e) => e is CustomDomainException && e.domainError == domainError);
}
