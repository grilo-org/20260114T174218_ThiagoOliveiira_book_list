import 'package:flutter/material.dart';

enum DomainError { notFound, unexpected, localCacheError }

extension DomainErrorExtension on DomainError {
  String description(BuildContext context) {
    switch (this) {
      case DomainError.notFound:
        return 'Livro não encontrado.';
      case DomainError.unexpected:
        return 'Algo deu errado. Tente novamente.';
      case DomainError.localCacheError:
        return 'Algo deu errado. Tente novamente.';
    }
  }
}
