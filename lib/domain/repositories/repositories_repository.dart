import 'package:clean_arch_sample/domain/entities/repository.dart';

abstract class RepositoriesRepository {
  Future<List<Repository>> getRepositories();
}