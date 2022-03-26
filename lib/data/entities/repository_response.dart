import 'package:flutter/foundation.dart';

@immutable
class RepositoryResponse {
  const RepositoryResponse({
    required this.name,
  });

  final String name;
}
