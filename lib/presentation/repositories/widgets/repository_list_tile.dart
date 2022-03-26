import 'package:clean_arch_sample/domain/entities/repository.dart';
import 'package:flutter/material.dart';

class RepositoriesListTile extends StatelessWidget {
  const RepositoriesListTile({
    required this.repository,
    Key? key,
  }) : super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repository.name),
    );
  }
}
