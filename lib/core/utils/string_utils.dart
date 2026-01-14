import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StringUtils {
  /// Extrai apenas o ano de uma string no formato "yyyy-MM-dd", "yyyy/MM/dd", etc.
  static String extractYear(String? value) {
    if (value == null || value.isEmpty) return '';

    // Tenta parsear como DateTime
    try {
      final date = DateTime.tryParse(value);
      if (date != null) return date.year.toString();
    } catch (_) {
      // ignora
    }

    // Caso não consiga, retorna os 4 primeiros caracteres
    return value.length >= 4 ? value.substring(0, 4) : value;
  }

  /// Formata uma data (string ou DateTime) no formato dd/MM/yyyy
  static String formatDate(String? value) {
    if (value == null || value.isEmpty) return '';

    try {
      final date = DateTime.tryParse(value);
      if (date != null) {
        return DateFormat('dd/MM/yyyy').format(date);
      }
    } catch (_) {
      // fallback
    }

    return value;
  }

  // ==================== Autores (ABNT) ====================
  /// Partículas comuns em nomes PT-BR que podem acompanhar o sobrenome.
  static const _particles = {'da', 'de', 'do', 'das', 'dos', 'di', 'du', 'del', 'della'};

  /// Retorna um mapa com `surname` (SOBRENOME c/ partícula se houver) e `givenNames` (restante).
  static ({String surname, List<String> givenNames}) _splitName(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return (surname: '', givenNames: const []);

    // Detecta sobrenome (última palavra + partícula anterior se houver).
    String surname = parts.last;
    int i = parts.length - 2;
    if (i >= 0 && _particles.contains(parts[i].toLowerCase())) {
      surname = '${parts[i]} $surname';
      i--;
    }
    final given = parts.sublist(0, i + 1);
    return (surname: surname, givenNames: given);
  }

  /// Abrevia prenomes (ex.: "Thiago da" -> "T."), ignorando partículas.
  static String _abbrevGiven(List<String> given) {
    final filtered = given.where((g) => !_particles.contains(g.toLowerCase()));
    return filtered.map((g) => '${g.characters.first.toUpperCase()}.').join(' ');
  }

  /// Formata um autor no padrão de **referência ABNT**: "SOBRENOME, P. P."
  static String _formatAuthorReference(String fullName) {
    final split = _splitName(fullName);
    final surnameUpper = split.surname.toUpperCase();
    final initials = _abbrevGiven(split.givenNames);
    return initials.isEmpty ? surnameUpper : '$surnameUpper, $initials';
  }

  /// Retorna apenas o **sobrenome em maiúsculas** (para citação no texto).
  static String _surnameUpper(String fullName) {
    final split = _splitName(fullName);
    return split.surname.toUpperCase();
  }

  /// Referência ABNT:
  /// - Até [maxAuthors] (padrão 3): lista todos, separados por "; "
  /// - Acima: "PRIMEIRO_AUTOR et al."
  static String formatAuthorsAbntReference(List<String> authors, {int maxAuthors = 3}) {
    if (authors.isEmpty) return '';
    if (authors.length <= maxAuthors) {
      return authors.map(_formatAuthorReference).join('; ');
    }
    return '${_formatAuthorReference(authors.first)} et al.';
  }

  /// Citação no texto ABNT:
  /// - Até [maxAuthors] (padrão 3): "SOBRENOME; SOBRENOME"
  /// - Acima: "SOBRENOME et al."
  static String formatAuthorsAbntInText(List<String> authors, {int maxAuthors = 3}) {
    if (authors.isEmpty) return '';
    if (authors.length <= maxAuthors) {
      return authors.map(_surnameUpper).join('; ');
    }
    return '${_surnameUpper(authors.first)} et al.';
  }
}
