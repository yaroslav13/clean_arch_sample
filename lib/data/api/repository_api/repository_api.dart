import 'package:clean_arch_sample/data/entities/repository_response.dart';

part 'repository_api_impl.dart';

abstract class RepositoryApi {
  factory RepositoryApi() = _RepositoryApiImpl;

  Future<List<RepositoryResponse>> getRepositories();
}