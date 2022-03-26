part of 'repository_api.dart';

class _RepositoryApiImpl implements RepositoryApi {
  @override
  Future<List<RepositoryResponse>> getRepositories() async {
    await Future<void>.delayed(const Duration(seconds: 5));

    return const <RepositoryResponse>[
      RepositoryResponse(name: 'Repository 1'),
      RepositoryResponse(name: 'Repository 2'),
      RepositoryResponse(name: 'Repository 3'),
    ];
  }
}