import 'package:clean_arch_sample/data/repositories/repositories_repository_impl.dart';
import 'package:clean_arch_sample/domain/entities/repository.dart';
import 'package:clean_arch_sample/domain/interactors/base/no_argument_interactor.dart';
import 'package:clean_arch_sample/domain/repositories/repositories_repository.dart';

class GetRepositoriesInteractor
    implements NoArgumentInteractor<List<Repository>> {
  GetRepositoriesInteractor()
      : _repositoriesRepository = RepositoryRepositoriesImpl();

  final RepositoriesRepository _repositoriesRepository;

  @override
  Future<List<Repository>> call() {
    return _repositoriesRepository.getRepositories();
  }
}
