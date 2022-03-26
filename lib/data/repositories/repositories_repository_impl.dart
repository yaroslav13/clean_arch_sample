import 'package:clean_arch_sample/data/api/repository_api/repository_api.dart';
import 'package:clean_arch_sample/data/mapper/repository_mapper.dart';
import 'package:clean_arch_sample/domain/entities/repository.dart';
import 'package:clean_arch_sample/domain/repositories/repositories_repository.dart';

class RepositoryRepositoriesImpl implements RepositoriesRepository {
  RepositoryRepositoriesImpl()
      : _repositoryApi = RepositoryApi(),
        _repositoryMapper = RepositoryMapper();

  final RepositoryApi _repositoryApi;
  final RepositoryMapper _repositoryMapper;

  @override
  Future<List<Repository>> getRepositories() async {
    final repositories = await _repositoryApi.getRepositories();

    return repositories.map(_repositoryMapper.map).toList();
  }
}
